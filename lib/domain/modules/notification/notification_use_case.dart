import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/notification_entity.dart';

import 'notfication_repository.dart';

abstract class NotificationUseCase {
  Future<List<NotificationEntity>> getListNotification();

  Future<bool> deleteNotificationById(String id);

  Future<bool> deleteAllNotification();

  Future<bool> changeTurnOnAndOffNotification(bool isTurnOn);
}

@Injectable(as: NotificationUseCase)
class NotificationUseCaseImpl extends NotificationUseCase {
  final NotificationRepository _repo;

  NotificationUseCaseImpl(this._repo);

  @override
  Future<bool> changeTurnOnAndOffNotification(bool isTurnOn) async {
    return await _repo.changeTurnOnAndOffNotification(isTurnOn);
  }

  @override
  Future<bool> deleteAllNotification() async {
    return await _repo.deleteAllNotification();
  }

  @override
  Future<bool> deleteNotificationById(String id) async {
    return await _repo.deleteNotificationById(id);
  }

  @override
  Future<List<NotificationEntity>> getListNotification() async {
    return await _repo.getListNotification();
  }
}
