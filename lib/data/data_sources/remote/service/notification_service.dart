import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/remote/base_servie.dart';

@Injectable()
class NotificationsService {
  final BaseService _service;

  NotificationsService(this._service);

  Future<Response> getListNotification() async {
    try {
      return await _service.dio.get(BaseService.notficationPath);
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> deleteAllNotification() async {
    try {
      return await _service.dio.delete(BaseService.notficationPath);
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> deleteNotificationById(String id) async {
    try {
      return await _service.dio.delete("${BaseService.notficationPath}/$id");
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
