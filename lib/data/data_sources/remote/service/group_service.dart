import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../base_servie.dart';

@Injectable()
class GroupService {
  GroupService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> createGroup(
      String? groupName, String? groupImage, List<String>? memberIds) async {
    try {
      return await _service.dio.post(BaseService.groupPath, data: {
        "name": groupName,
        "image_url": groupImage,
        "members": memberIds
      });
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getGroupList() async {
    try {
      return await _service.dio.get(BaseService.groupPath);
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getReceivedRequest() async {
    try {
      return await _service.dio
          .get('${BaseService.groupPath}/request/received');
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getSentRequest() async {
    try {
      return await _service.dio.get('${BaseService.groupPath}/request/sent');
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> recallSentRequest(String groupId, String friendId) async {
    try {
      return await _service.dio
          .delete('${BaseService.groupPath}/request/$groupId/$friendId');
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> rejectReceivedRequest(String groupId) async {
    try {
      return await _service.dio
          .delete('${BaseService.groupPath}/request/$groupId/reject');
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> acceptReceivedRequest(String groupId) async {
    try {
      return await _service.dio
          .post('${BaseService.groupPath}/request/$groupId/accept');
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
