import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../base_servie.dart';

@Injectable()
class CallFriendService {
  CallFriendService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> createNewFriendCall(String friendId) async {
    try {
      return await _service.dio.post("${BaseService.callPath}/$friendId");
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> joinFriendCall(String callRoomId) async {
    try {
      return await _service.dio.get("${BaseService.callPath}/$callRoomId");
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getCallList(String? status, String? calleeId) async {
    try {
      String endPoint = '';
      if (status != null && calleeId != null) {
        endPoint += '?status=$status&callee=$calleeId';
      } else if (status != null) {
        endPoint += '?status=$status';
      } else if (calleeId != null) {
        endPoint += '?callee=$calleeId';
      }
      return await _service.dio.get('${BaseService.callPath}$endPoint'
          // queryParameters: {"status": status, "callee": calleeId},
          );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> abandonCall(String chatRoomId) async {
    try {
      return await _service.dio
          .delete("${BaseService.callPath}/$chatRoomId/abandon");
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> rejectCall(String chatRoomId) async {
    try {
      return await _service.dio
          .delete("${BaseService.callPath}/$chatRoomId/reject");
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
