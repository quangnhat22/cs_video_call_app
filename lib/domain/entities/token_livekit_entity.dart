import 'package:videocall/data/models/token_livekit_model.dart';

class TokenLiveKitEntity {
  final String? token;
  final String? roomId;

  TokenLiveKitEntity({
    this.token,
    this.roomId,
  });

  static TokenLiveKitEntity convertToTokenLiveKitEntity({
    TokenLiveKitModel? model,
  }) {
    return TokenLiveKitEntity(token: model?.token, roomId: model?.roomId);
  }
}
