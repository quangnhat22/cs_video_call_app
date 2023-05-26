import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/group/group_repository.dart';

abstract class GroupUseCase {
  Future<void> createGroup(String? groupName, String? imageUrl);
}

@Injectable(as: GroupUseCase)
class GroupUseCaseImpl extends GroupUseCase {
  GroupUseCaseImpl({required GroupRepository groupRepo}) : _repo = groupRepo;

  final GroupRepository _repo;

  @override
  Future<void> createGroup(String? groupName, String? imageUrl) {
    return _repo.createGroup(groupName, imageUrl);
  }
}