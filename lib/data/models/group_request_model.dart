import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:videocall/data/models/group_model.dart';
import 'package:videocall/data/models/user_model.dart';

part 'group_request_model.freezed.dart';
part 'group_request_model.g.dart';

@freezed
class GroupRequestModel with _$GroupRequestModel {
  GroupRequestModel._();

  factory GroupRequestModel({
    UserModel? sender,
    UserModel? receiver,
    GroupModel? group,
    // ignore: invalid_annotation_target
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _GroupRequestModel;

  factory GroupRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GroupRequestModelFromJson(json);
}
