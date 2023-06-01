import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_model.freezed.dart';
part 'group_model.g.dart';

@freezed
class GroupModel with _$GroupModel {
  const factory GroupModel(
      {required String id,
      String? name,
      // List<UserModel?>? members,
      // ignore: invalid_annotation_target
      @JsonKey(name: 'image_url') String? imageUrl}) = _GroupModel;

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);
}
