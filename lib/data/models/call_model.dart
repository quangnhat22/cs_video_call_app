import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:videocall/data/models/user_model.dart';

part 'call_model.freezed.dart';
part 'call_model.g.dart';

@freezed
class CallModel with _$CallModel {
  const factory CallModel(
      {required String id,
      UserModel? callee,
      UserModel? caller,
      // ignore: invalid_annotation_target
      @JsonKey(name: "called_at") DateTime? calledAt,
      String? status}) = _CallModel;

  factory CallModel.fromJson(Map<String, dynamic> json) =>
      _$CallModelFromJson(json);
}
