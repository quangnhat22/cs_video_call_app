import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/domain/entities/notification_entity.dart';
import 'package:videocall/domain/modules/call/friend_call_use_case.dart';
import 'package:videocall/domain/modules/friend/friend_usecase.dart';
import 'package:videocall/domain/modules/group/group_usecase.dart';
import 'package:videocall/domain/modules/notification/notification_use_case.dart';

part 'notification_bloc.freezed.dart';
part 'notification_event.dart';
part 'notification_state.dart';

@Injectable()
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationUseCase _notificationUC;
  final FriendUseCase _friendUC;
  final GroupUseCase _groupUC;
  final FriendCallUseCase _friendCallUseCase;

  NotificationBloc(this._notificationUC, this._friendUC, this._groupUC,
      this._friendCallUseCase)
      : super(const NotificationState.initial()) {
    on<NotificationEvent>((event, emit) async {
      await event.map(
          started: (event) => _started(event, emit),
          refreshed: (event) => _refreshed(event, emit),
          notificationDeleted: (event) => _notificationDeleted(event, emit),
          listNotificationDeleted: (event) =>
              _listNotificationDeleted(event, emit),
          actionWithNotification: (event) =>
              _actionWithNotification(event, emit));
    });
  }

  Future<void> _started(_Started event, Emitter<NotificationState> emit) async {
    try {
      emit(const GetListNotificationInProgress());
      final listNoti = await _notificationUC.getListNotification();
      emit(GetListNotificationInSuccess(listNotification: listNoti));
    } catch (e) {
      emit(GetListNotificationInFail(message: e.toString()));
    }
  }

  Future<void> _refreshed(
      NotificationRefreshed event, Emitter<NotificationState> emit) async {
    try {
      final listNoti = await _notificationUC.getListNotification();
      emit(GetListNotificationInSuccess(listNotification: listNoti));
    } catch (e) {
      emit(GetListNotificationInFail(message: e.toString()));
    }
  }

  Future<void> _notificationDeleted(
      NotificationDeletedById event, Emitter<NotificationState> emit) async {
    try {
      final isDeleteSuccess =
          await _notificationUC.deleteNotificationById(event.id);
      if (isDeleteSuccess) {
        SnackBarApp.showSnackBar(
            null, 'Delete notification success', TypesSnackBar.success);
        add(const NotificationRefreshed());
      } else {
        SnackBarApp.showSnackBar(
            null, 'Delete notification fail', TypesSnackBar.success);
      }
    } catch (e) {
      SnackBarApp.showSnackBar(
          null, 'Delete notification fail', TypesSnackBar.success);
      throw Exception(e.toString());
    }
  }

  Future<void> _listNotificationDeleted(
      ListNotificationDeleted event, Emitter<NotificationState> emit) async {
    try {
      final isDeleteSuccess = await _notificationUC.deleteAllNotification();
      if (isDeleteSuccess) {
        SnackBarApp.showSnackBar(
            null, 'Delete all notification success', TypesSnackBar.success);
        add(const NotificationRefreshed());
      } else {
        SnackBarApp.showSnackBar(
            null, 'Delete all notification fail', TypesSnackBar.success);
      }
    } catch (e) {
      SnackBarApp.showSnackBar(
          null, 'Delete all notification fail', TypesSnackBar.success);
      throw Exception(e.toString());
    }
  }

  Future<void> _actionWithNotification(
      NotifcationTapped event, Emitter<NotificationState> emit) async {
    try {
      bool isSuccess = false;
      if (event.actionType == 'receive-friend-request') {
        isSuccess = event.isAccept
            ? await _friendUC.acceptReceiveRequest(event.id)
            : await _friendUC.rejectReceiveRequest(event.id);
        await AwesomeNotifications().dismiss(2);
      } else if (event.actionType == 'receive-group-request') {
        isSuccess = event.isAccept
            ? await _groupUC.acceptReceivedGroup(event.id)
            : await _groupUC.rejectReceivedRequest(event.id);
        await AwesomeNotifications().dismiss(3);
      } else if (event.actionType == 'incoming-call') {
        if (event.isAccept) {
          isSuccess = true;
          NavigationUtil.pushNamed(routeName: RouteName.personalCall, args: {
            'friendId': event.friendId,
            'chatRoomId': event.id,
          });
        } else {
          isSuccess = await _friendCallUseCase.rejectCall(event.id);
        }
        AwesomeNotifications().dismiss(4);
      }
      if (isSuccess) {
        SnackBarApp.showSnackBar(
            null, 'Action with notification success', TypesSnackBar.success);
        add(const NotificationRefreshed());
      } else {
        SnackBarApp.showSnackBar(
            null, 'Action with notification fail', TypesSnackBar.success);
      }
    } catch (e) {
      SnackBarApp.showSnackBar(
          null, 'Delete notification fail', TypesSnackBar.success);
      throw Exception(e.toString());
    }
  }
}
