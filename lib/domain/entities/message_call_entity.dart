import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_call_entity.freezed.dart';
part 'message_call_entity.g.dart';

@freezed
class MessageCallEntity with _$MessageCallEntity {
  const factory MessageCallEntity({
    String? name,
    String? avatar,
    String? message,
    DateTime? senderTime,
  }) = _MessageCallEntity;

  factory MessageCallEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageCallEntityFromJson(json);
}
