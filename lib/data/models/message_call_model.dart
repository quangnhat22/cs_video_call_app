import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_call_model.freezed.dart';
part 'message_call_model.g.dart';

@freezed
class MessageCallModel with _$MessageCallModel {
  const factory MessageCallModel({
    required String id,
    String? groupId,
    String? senderId,
    String? name,
    String? avatar,
    String? message,
    DateTime? senderTime,
  }) = _MessageCallModel;

  factory MessageCallModel.fromJson(Map<String, dynamic> json) =>
      _$MessageCallModelFromJson(json);
}
