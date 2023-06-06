import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:videocall/data/models/group_model.dart';
import 'package:videocall/data/models/user_model.dart';

part 'group_details_model.freezed.dart';
part 'group_details_model.g.dart';

@freezed
class GroupDetailsModel with _$GroupDetailsModel {
  factory GroupDetailsModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: "group_details") GroupModel? groupDetails,
    List<UserModel>? members,
  }) = _GroupDetailsModel;

  factory GroupDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$$_GroupDetailsModelFromJson(json);
}
