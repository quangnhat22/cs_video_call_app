import 'package:freezed_annotation/freezed_annotation.dart';

import 'notification_subject_model.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationsModel with _$NotificationsModel {
  NotificationsModel._();

  factory NotificationsModel({
    required String id,
    // ignore: invalid_annotation_target
    @JsonKey(name: "created_at") DateTime? createdAt,
    NotificationSubjectModel? subject,
    NotificationSubjectModel? prep,
    NotificationSubjectModel? indirect,
    String? action,
  }) = _NotificationsModel;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsModelFromJson(json);
}
