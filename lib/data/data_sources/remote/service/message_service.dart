import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../base_servie.dart';

@Injectable()
class MessageService {
  MessageService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> getPinnedMessages(String groupId) async {
    try {
      return await _service.dio.get('${BaseService.messagePath}/$groupId');
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> unpinMessage(String messageId) async {
    try {
      return await _service.dio.delete('${BaseService.messagePath}/$messageId');
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> pinMessage(
      String groupId, String senderId, String content, DateTime sentAt) async {
    try {
      return await _service.dio.post(BaseService.messagePath, data: {
        "group_id": groupId,
        "sender_id": senderId,
        "content": content,
        "sent_at": sentAt.toUtc().toIso8601String()
      });
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
