import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
@HiveType(typeId: 0)
abstract class UserModel extends HiveObject with _$UserModel {
  UserModel._();

  factory UserModel({
    @HiveField(0)
        required String id,
    @HiveField(1)
        String? name,
    @HiveField(2)
        String? avatar,
    @HiveField(3)
        String? email,
    @HiveField(4)
        String? phone,
    @HiveField(5)
        String? gender,
    @HiveField(6)
        String? bio,
    @HiveField(7)
        DateTime? birthday,
    @HiveField(8)
        String? relation,
    @HiveField(9)
    // ignore: invalid_annotation_target
    @JsonKey(name: "common_friend_count", ignore: true)
        int? commonFriendCount,
    // ignore: invalid_annotation_target
    @JsonKey(name: "is_friend", ignore: true)
        bool? isFriend,
    // ignore: invalid_annotation_target
    @JsonKey(name: "last_seen_at", ignore: true)
        DateTime? lastSeenAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
