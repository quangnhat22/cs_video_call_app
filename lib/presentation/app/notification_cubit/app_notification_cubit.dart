import 'dart:convert';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/core/utils/snack_bar.dart';
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
  }

  void _initializeNotificationsEventListeners() async {
    await AwesomeNotifications().setListeners(
      onNotificationDisplayedMethod: _onNotificationDisplayedMethod,
      onActionReceivedMethod: onActionReceivedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  Future<void> _onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    log(receivedNotification.toString(), name: "onNotificationDisplay");
    SnackBarApp.showTopSnackBar(
        receivedNotification.body.toString(), TypesSnackBar.warning);
    if (receivedNotification.channelKey == 'call_channel') {
      if (receivedNotification.title == 'Abandon call') {
        await Future.delayed(const Duration(milliseconds: 300), () async {
          await AwesomeNotifications()
              .dismissNotificationsByChannelKey('call_channel');
        });
      }
    }
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
      if (receivedAction.channelKey == 'call_channel') {
        final friendId = payload.subject?.id;
        final chatRoomId = payload.prep?.id;
        switch (receivedAction.buttonKeyPressed) {
          case 'deny':
            if (chatRoomId != null) {
              await _friendCallUseCase.rejectCall(chatRoomId);
            }

            break;

          case 'accept':
            String? currentPath;
            NavigationUtil.navigatorKey?.popUntil((route) {
              currentPath = route.settings.name;
              return true;
            });

            if (currentPath == '/') {
              NavigationUtil.pushNamed(
                  routeName: RouteName.personalCall,
                  args: {'friendId': friendId, 'chatRoomId': chatRoomId});
            } else {
              NavigationUtil.pop();
              NavigationUtil.pushNamed(
                  routeName: RouteName.personalCall,
                  args: {'friendId': friendId, 'chatRoomId': chatRoomId});
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
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @pragma("vm:entry-point")
  Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      if (receivedAction.payload == null) return;
      final notiJson = jsonDecode(receivedAction.payload!["notification"]!);
      final payload = NotificationsModel.fromJson(notiJson);
      final friendId = payload.subject?.id;
      final chatRoomId = payload.prep?.id;
      if (receivedAction.channelKey == 'call_channel') {
        switch (receivedAction.buttonKeyPressed) {
          case 'deny':
            if (chatRoomId != null) {
              await _friendCallUseCase.rejectCall(chatRoomId);
            }

            break;

          case 'accept':
            String? currentPath;
            NavigationUtil.navigatorKey?.popUntil((route) {
              currentPath = route.settings.name;
              return true;
            });

            if (currentPath == '/') {
              NavigationUtil.pushNamed(
                  routeName: RouteName.personalCall,
                  args: {'friendId': friendId, 'chatRoomId': chatRoomId});
            } else {
              NavigationUtil.pop();
              NavigationUtil.pushNamed(
                  routeName: RouteName.personalCall,
                  args: {'friendId': friendId, 'chatRoomId': chatRoomId});
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
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
