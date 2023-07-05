import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_subject_model.freezed.dart';
part 'notification_subject_model.g.dart';

@freezed
class NotificationSubjectModel with _$NotificationSubjectModel {
  NotificationSubjectModel._();

  factory NotificationSubjectModel({
    required String id,
    String? name,
    String? image,
    String? type,
  }) = _NotificationSubjectModel;

  factory NotificationSubjectModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationSubjectModelFromJson(json);
}
