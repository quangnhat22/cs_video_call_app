import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../base_servie.dart';

@Injectable()
class CallGroupService {
  CallGroupService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> createNewMeeting(
    String groupId,
    String? title,
    String? description,
  ) async {
    try {
      return await _service.dio
          .post("${BaseService.groupCallPath}/$groupId", data: {
        "title": title,
        "description": description,
      });
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> joinMeeting(
    String groupId,
    String meetingId,
  ) async {
    try {
      return await _service.dio
          .post("${BaseService.groupCallPath}/$groupId/$meetingId");
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getListGroupMeeting(
    String groupId,
  ) async {
    try {
      return await _service.dio.get("${BaseService.groupCallPath}/$groupId");
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
