import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/search_entity.dart';
import 'package:videocall/domain/modules/search/search_repository.dart';

abstract class SearchUseCase {
  Future<SearchEntity?> searchGlobally(String? query);
}

@Injectable(as: SearchUseCase)
class SearchUseCaseImpl extends SearchUseCase {
  final SearchRepository repo;

  SearchUseCaseImpl({required this.repo});

  @override
  Future<SearchEntity?> searchGlobally(String? query) async {
    return await repo.searchGlobally(query);
  }
}
