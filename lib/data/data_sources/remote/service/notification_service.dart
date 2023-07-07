import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/remote/base_servie.dart';

@Injectable()
class NotificationsService {
  final BaseService _service;

  NotificationsService(this._service);

  Future<Response> getListNotification() async {
    try {
      return await _service.dio.get(BaseService.notificationPath);
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> deleteAllNotification() async {
    try {
      return await _service.dio.delete(BaseService.notificationPath);
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> deleteNotificationById(String id) async {
    try {
      return await _service.dio.delete("${BaseService.notificationPath}/$id");
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getNotificationSetting() async {
    try {
      return await _service.dio
          .get("${BaseService.notificationPath}/notification-setting");
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> updateNotificationSetting(bool value) async {
    try {
      return await _service.dio.put(
        "${BaseService.notificationPath}/notification-setting",
        data: {"notification": value},
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
