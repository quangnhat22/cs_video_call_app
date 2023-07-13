import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/remote/service/call_friend_service.dart';

import 'package:videocall/data/models/call_model.dart';
import 'package:videocall/data/models/token_livekit_model.dart';
import 'package:videocall/domain/entities/call_entity.dart';
import 'package:videocall/domain/entities/token_livekit_entity.dart';
import 'package:videocall/domain/modules/call/friend_call_repository.dart';
import 'package:videocall/domain/modules/user/user_repository.dart';

@Injectable(as: FriendCallRepository)
class FriendCallRepositoryImpl extends FriendCallRepository {
  final CallFriendService _service;
  final UserRepository _userRepo;

  FriendCallRepositoryImpl(this._service, this._userRepo);

  @override
  Future<TokenLiveKitEntity?> createFriendCall(String friendId) async {
    try {
      final res = await _service.createNewFriendCall(friendId);
      if (res.statusCode == 200) {
        final tokenJson = TokenLiveKitModel.fromJson(res.data["data"]);
        return TokenLiveKitEntity.convertToTokenLiveKitEntity(model: tokenJson);
      }
      return null;
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String?> joinFriendCall(String callRoomId) async {
    try {
      final res = await _service.joinFriendCall(callRoomId);
      if (res.statusCode == 200) {
        final token = res.data["data"] as String;
        return token;
      }
      return null;
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<CallEntity>> getCallList(String? status, String? callee) async {
    try {
      final userInfo = await _userRepo.getSelf();
      final res = await _service.getCallList(status, callee);
      if (res.statusCode == 200) {
        final listCallJson = res.data["data"] as List<dynamic>?;

        if (listCallJson != null) {
          final callModels = listCallJson
              .map((callJson) => CallModel.fromJson(callJson))
              .toList();

          final callEntities = callModels
              .map((callModel) => CallEntity.convertToCallEntity(
                  model: callModel, id: userInfo.id))
              .toList();

          return callEntities;
        }
      }

      return List<CallEntity>.empty();
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<bool> abandonCall(String callRoomId) async {
    try {
      final res = await _service.abandonCall(callRoomId);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<bool> rejectCall(String callRoomId) async {
    try {
      final res = await _service.rejectCall(callRoomId);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e..toString());
    }
  }

  @override
  Future<bool> clearHistoryCall() async {
    try {
      final res = await _service.clearHistoryCall();
      if (res.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      throw Exception(e..toString());
    }
  }
}
