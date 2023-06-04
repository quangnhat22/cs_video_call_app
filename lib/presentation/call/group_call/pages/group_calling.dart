import 'dart:convert';
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
    // WidgetsBindingCompatible.instance?.addPostFrameCallback((_) {
    //   _askPublish();
    // });
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

    final localParticipantTracks = widget.room.localParticipant?.videoTracks;
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
    setState(() {
      participantTracks = [...screenTracks, ...userMediaTracks];
    });
  }

  void _setUpListeners() => _listener
    ..on<RoomDisconnectedEvent>((event) async {
      if (event.reason != null) {
        print('Room disconnected: reason => ${event.reason}');
      }
      WidgetsBindingCompatible.instance
          ?.addPostFrameCallback((timeStamp) => Navigator.pop(context));
    })
    ..on<RoomRecordingStatusChanged>((event) {
      context.showRecordingStatusChangedDialog(event.activeRecording);
    })
    ..on<LocalTrackPublishedEvent>((_) => _sortParticipants())
    ..on<LocalTrackUnpublishedEvent>((_) => _sortParticipants())
    ..on<ParticipantNameUpdatedEvent>((event) {
      print(
          'Participant name updated: ${event.participant.identity}, name => ${event.name}');
    })
    ..on<DataReceivedEvent>((event) {
      String decoded = 'Failed to decode';
      try {
        decoded = utf8.decode(event.data);
      } catch (_) {
        print('Failed to decode: $_');
      }
      context.showDataReceivedDialog(decoded);
    })
    ..on<AudioPlaybackStatusChanged>((event) async {
      if (!widget.room.canPlaybackAudio) {
        print('Audio playback failed for iOS Safari ..........');
        bool? yesno = await context.showPlayAudioManuallyDialog();
        if (yesno == true) {
          await widget.room.startAudio();
        }
      }
    });

  Future<bool?> _showPublishDialog() => showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Publish'),
          content: Text('Would you like to publish your Camera & Mic ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('NO'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('YES'),
            ),
          ],
        ),
      );

  void _askPublish() async {
    final result = await _showPublishDialog();
    if (result != true) return;
    // video will fail when running in ios simulator
    try {
      await widget.room.localParticipant?.setCameraEnabled(true);
    } catch (error) {
      print('could not publish video: $error');
      await context.showErrorDialog(error);
    }
    try {
      await widget.room.localParticipant?.setMicrophoneEnabled(true);
    } catch (error) {
      print('could not publish audio: $error');
      await context.showErrorDialog(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: participantTracks.isNotEmpty
                      ? ParticipantWidget.widgetFor(participantTracks.first,
                          showStatsLayer: true)
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
                    child: ParticipantWidget.widgetFor(
                        participantTracks[index + 1]),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
