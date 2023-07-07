import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/remote/service/device_service.dart';
import 'package:videocall/data/data_sources/remote/service/notification_service.dart';
import 'package:videocall/data/models/notification_model.dart';
import 'package:videocall/domain/entities/notification_entity.dart';
import 'package:videocall/domain/modules/notification/notfication_repository.dart';
import 'package:videocall/services/notification_service.dart';

@Injectable(as: NotificationRepository)
class NotificationRepositoryImpl extends NotificationRepository {
  final NotificationsService _service;
  final NotificationService _awesomeService;
  final DeviceService _deviceService;

  NotificationRepositoryImpl(
      this._service, this._awesomeService, this._deviceService);

  @override
  Future<bool> deleteAllNotification() async {
    try {
      final res = await _service.deleteAllNotification();
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<bool> deleteNotificationById(String id) async {
    try {
      final res = await _service.deleteNotificationById(id);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<List<NotificationEntity>> getListNotification() async {
    try {
      final res = await _service.getListNotification();
      if (res.statusCode == 200) {
        final listDeviceJson = res.data["data"] as List<dynamic>?;
        if (listDeviceJson != null) {
          final listNotificationModel = listDeviceJson
              .map((notiJson) => NotificationsModel.fromJson(notiJson))
              .toList();

          final listNotiEntity = listNotificationModel
              .map((notiModel) =>
                  NotificationEntity.convertToNotificationEntity(
                      model: notiModel))
              .toList();

          return listNotiEntity;
        }
      }

      return List<NotificationEntity>.empty();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> getNotificationSetting() async {
    try {
      final res = await _service.getNotificationSetting();
      if (res.statusCode == 200) {
        final isTurnOn = res.data["data"] as bool;
        return isTurnOn;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateNotificationSetting(bool value) async {
    try {
      final res = await _service.updateNotificationSetting(value);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e..toString());
    }
  }
}
