import 'package:videocall/domain/entities/search_entity.dart';

abstract class SearchRepository {
  Future<SearchEntity?> searchGlobally(String? query);
}
