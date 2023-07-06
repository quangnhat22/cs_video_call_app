import 'dart:convert';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/data/models/notification_model.dart';
import 'package:videocall/domain/modules/call/friend_call_use_case.dart';
import 'package:videocall/domain/modules/friend/friend_usecase.dart';
import 'package:videocall/domain/modules/group/group_usecase.dart';

part 'app_notification_cubit.freezed.dart';
part 'app_notification_state.dart';

@Singleton()
class AppNotificationCubit extends Cubit<AppNotificationState> {
  final FriendUseCase _friendUC;
  final GroupUseCase _groupUC;
  final FriendCallUseCase _friendCallUseCase;

  late final Stream<bool> streamStatusSub;

  AppNotificationCubit(this._friendUC, this._groupUC, this._friendCallUseCase)
      : super(const AppNotificationState.initial()) {
    _initializeNotificationsEventListeners();

    FlutterCallkitIncoming.onEvent.listen((CallEvent? event) async {
      switch (event!.event) {
        case Event.actionCallIncoming:
          await AwesomeNotifications()
              .dismissNotificationsByChannelKey("call_channel");
          break;

        case Event.actionCallAccept:
          NavigationUtil.pushNamed(routeName: RouteName.personalCall, args: {
            'friendId': event.body["extra"]["friendId"],
            'chatRoomId': event.body["extra"]["chatRoomId"]
          });
          break;
        case Event.actionCallDecline:
          await _friendCallUseCase
              .rejectCall(event.body["extra"]["chatRoomId"]);
          break;
        case Event.actionCallStart:
        case Event.actionCallEnded:
        case Event.actionCallTimeout:
        case Event.actionCallCallback:
        case Event.actionCallCustom:
        case Event.actionDidUpdateDevicePushTokenVoip:
        case Event.actionCallToggleHold:
        case Event.actionCallToggleMute:
        case Event.actionCallToggleDmtf:
        case Event.actionCallToggleGroup:
        case Event.actionCallToggleAudioSession:
          break;
      }
    });
  }

  void _initializeNotificationsEventListeners() async {
    // Only after at least the action method is set, the notification events are delivered
    await AwesomeNotifications().setListeners(
      onNotificationCreatedMethod: _onNotificationCreatedMethod,
      onNotificationDisplayedMethod: _onNotificationDisplayedMethod,
      onActionReceivedMethod: onActionReceivedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  Future<void> _onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    log(receivedNotification.toString(), name: "onNotificationDisplay");
  }

  Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    try {
      if (receivedAction.payload == null) return;
      final notiJson = jsonDecode(receivedAction.payload!["notification"]!);
      final payload = NotificationsModel.fromJson(notiJson);
      if (receivedAction.channelKey == 'basic_channel') {
        if (payload.action == 'receive-friend-request') {
          switch (receivedAction.buttonKeyPressed) {
            case 'deny':
              if (payload.prep?.id != null) {
                await _friendUC.rejectReceiveRequest(payload.prep!.id);
              }
              break;

            case 'accept':
              if (payload.prep?.id != null) {
                await _friendUC.acceptReceiveRequest(payload.prep!.id);
              }
              break;

            default:
              NavigationUtil.loadSingletonPage(
                targetPage: RouteName.dashboard,
                receivedAction: receivedAction,
              );
              break;
          }
        }
        if (payload.action == 'receive-group-request') {
          switch (receivedAction.buttonKeyPressed) {
            case 'deny':
              await _groupUC.rejectReceivedRequest(payload.indirect!.id);
              break;

            case 'accept':
              await _groupUC.acceptReceivedGroup(payload.indirect!.id);
              break;

            default:
              NavigationUtil.loadSingletonPage(
                targetPage: RouteName.dashboard,
                receivedAction: receivedAction,
              );
              break;
          }
        }
      }
      if (receivedAction.channelKey == 'call_channel') {}
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @pragma("vm:entry-point")
  Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    WidgetsFlutterBinding.ensureInitialized();

    if (receivedAction.channelKey == "basic_channel") {
    } else if (receivedAction.channelKey == "call_channel") {
      await _receiveCallNotificationAction(receivedAction);
    }
  }

  @pragma("vm:entry-point")
  static Future<void> _receiveCallNotificationAction(
      ReceivedAction receivedAction) async {
    switch (receivedAction.buttonKeyPressed) {
      case 'REJECT':
        // Is not necessary to do anything, because the reject button is
        // already auto dismissible
        break;

      case 'ACCEPT':
        // NavigationUtil.loadSingletonPage(
        //   targetPage: RouteName.personalCall,
        //   receivedAction: receivedAction,
        // );
        break;

      default:
        // loadSingletonPage(App.navigatorKey.currentState,
        //     targetPage: PAGE_PHONE_CALL, receivedAction: receivedAction);
        break;
    }
  }

  Future<void> _onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    log(receivedNotification.toString(), name: "onReceivedAction");

    if (receivedNotification.payload == null) return;
    final notiJson = jsonDecode(receivedNotification.payload!["notification"]!);
    final payload = NotificationsModel.fromJson(notiJson);
    if (payload.action == "incoming-call") {
      _showInComingCall(payload);
    }
  }

  Future<void> _showInComingCall(NotificationsModel notificationModel) async {
    try {
      CallKitParams callKitParams = CallKitParams(
        id: notificationModel.id,
        nameCaller: notificationModel.subject?.name ?? 'Unknow name',
        appName: 'CS VideoCall App',
        avatar: notificationModel.subject?.image,
        type: 0,
        textAccept: 'Accept',
        textDecline: 'Decline',
        missedCallNotification: const NotificationParams(
          showNotification: true,
          isShowCallback: true,
          subtitle: 'Missed call',
          callbackText: 'Call back',
        ),
        duration: 30000,
        extra: <String, dynamic>{
          'friendId': notificationModel.subject?.id,
          'chatRoomId': notificationModel.prep?.id
        },
        android: AndroidParams(
            isCustomNotification: true,
            isCustomSmallExNotification: true,
            isShowLogo: false,
            ringtonePath: 'system_ringtone_default',
            backgroundColor: '#0955fa',
            backgroundUrl: notificationModel.subject?.image,
            actionColor: '#4CAF50',
            incomingCallNotificationChannelName: "Incoming Call",
            missedCallNotificationChannelName: "Missed Call"),
      );
      await FlutterCallkitIncoming.showCallkitIncoming(callKitParams);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
