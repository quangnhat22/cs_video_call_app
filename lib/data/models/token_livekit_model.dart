import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_livekit_model.freezed.dart';
part 'token_livekit_model.g.dart';

@freezed
class TokenLiveKitModel with _$TokenLiveKitModel {
  factory TokenLiveKitModel(
      {String? token,
      // ignore: invalid_annotation_target
      @JsonKey(name: "room_id") String? roomId}) = _TokenLiveKitModel;

  factory TokenLiveKitModel.fromJson(Map<String, dynamic> json) =>
      _$TokenLiveKitModelFromJson(json);
}
