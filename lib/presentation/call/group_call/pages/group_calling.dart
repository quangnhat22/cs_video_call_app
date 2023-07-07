import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:videocall/common/widgets/stateless/call/video_render/participant_info.dart';
import 'package:videocall/core/utils/live_kit_until.dart';
import 'package:videocall/presentation/call/group_call/widgets/controls.dart';

import '../../../../common/widgets/stateless/call/video_render/participant.dart';

class GroupCalling extends StatefulWidget {
  const GroupCalling({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  State<GroupCalling> createState() => _GroupCallingState();
}

class _GroupCallingState extends State<GroupCalling> {
  List<ParticipantTrack> participantTracks = [];

  EventsListener<RoomEvent> get _listener => widget.room.createListener();

  @override
  void initState() {
    super.initState();
    widget.room.addListener(_onRoomDidUpdate);
    _setUpListeners();
    _sortParticipants();
  }

  @override
  void dispose() {
    (() async {
      widget.room.removeListener(_onRoomDidUpdate);
      await _listener.dispose();
    })();
    super.dispose();
  }

  void _onRoomDidUpdate() {
    _sortParticipants();
  }

  void _sortParticipants() {
    if (mounted) {
      List<ParticipantTrack> userMediaTracks = [];
      List<ParticipantTrack> screenTracks = [];
      for (var participant in widget.room.participants.values) {
        for (var t in participant.videoTracks) {
          if (t.isScreenShare) {
            screenTracks.add(ParticipantTrack(
              participant: participant,
              videoTrack: t.track,
              isScreenShare: true,
            ));
          } else {
            userMediaTracks.add(ParticipantTrack(
              participant: participant,
              videoTrack: t.track,
              isScreenShare: false,
            ));
          }
        }
      }
      // sort speakers for the grid
      userMediaTracks.sort((a, b) {
        // loudest speaker first
        if (a.participant.isSpeaking && b.participant.isSpeaking) {
          if (a.participant.audioLevel > b.participant.audioLevel) {
            return -1;
          } else {
            return 1;
          }
        }

        // last spoken at
        final aSpokeAt = a.participant.lastSpokeAt?.millisecondsSinceEpoch ?? 0;
        final bSpokeAt = b.participant.lastSpokeAt?.millisecondsSinceEpoch ?? 0;

        if (aSpokeAt != bSpokeAt) {
          return aSpokeAt > bSpokeAt ? -1 : 1;
        }

        // video on
        if (a.participant.hasVideo != b.participant.hasVideo) {
          return a.participant.hasVideo ? -1 : 1;
        }

        // joinedAt
        return a.participant.joinedAt.millisecondsSinceEpoch -
            b.participant.joinedAt.millisecondsSinceEpoch;
      });

      if (mounted) {
        final localParticipantTracks =
            widget.room.localParticipant?.videoTracks;
        if (localParticipantTracks != null) {
          for (var t in localParticipantTracks) {
            if (t.isScreenShare) {
              screenTracks.add(ParticipantTrack(
                participant: widget.room.localParticipant!,
                videoTrack: t.track,
                isScreenShare: true,
              ));
            } else {
              userMediaTracks.add(ParticipantTrack(
                participant: widget.room.localParticipant!,
                videoTrack: t.track,
                isScreenShare: false,
              ));
            }
          }
        }
      }

      if (mounted) {
        setState(() {
          participantTracks = [...screenTracks, ...userMediaTracks];
        });
      }
    }
  }

  void _setUpListeners() => _listener
    ..on<RoomDisconnectedEvent>((event) async {
      WidgetsBindingCompatible.instance
          ?.addPostFrameCallback((timeStamp) => Navigator.pop(context));
    })
    ..on<RoomRecordingStatusChanged>((event) {
      if (mounted) {
        context.showRecordingStatusChangedDialog(event.activeRecording);
      }
    })
    ..on<LocalTrackPublishedEvent>((_) {
      if (mounted) {
        return _sortParticipants();
      }
    })
    ..on<LocalTrackUnpublishedEvent>((_) {
      if (mounted) {
        return _sortParticipants();
      }
    })
    ..on<ParticipantNameUpdatedEvent>((event) {
      log('Participant name updated: ${event.participant.identity}, name => ${event.name}');
    })
    ..on<AudioPlaybackStatusChanged>((event) async {
      if (mounted && !widget.room.canPlaybackAudio) {
        log('Audio playback failed for iOS Safari ..........');
        bool? yesno = await context.showPlayAudioManuallyDialog();
        if (yesno == true) {
          await widget.room.startAudio();
        }
      }
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: participantTracks.isNotEmpty
                      ? ParticipantWidget.widgetFor(participantTracks.first)
                      : Container()),
              if (widget.room.localParticipant != null)
                SafeArea(
                  top: false,
                  child: Controls(
                    room: widget.room,
                    participant: widget.room.localParticipant!,
                  ),
                )
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: math.max(0, participantTracks.length - 1),
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  width: 180,
                  height: 120,
                  child:
                      ParticipantWidget.widgetFor(participantTracks[index + 1]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
