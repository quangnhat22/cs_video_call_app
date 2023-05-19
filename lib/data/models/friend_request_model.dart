import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_model.dart';

part 'friend_request_model.freezed.dart';
part 'friend_request_model.g.dart';

@freezed
class FriendRequestModel with _$FriendRequestModel {
  FriendRequestModel._();

  factory FriendRequestModel({
    UserModel? sender,
    UserModel? receiver,
    // ignore: invalid_annotation_target
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _FriendRequestModel;

  factory FriendRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestModelFromJson(json);
}
