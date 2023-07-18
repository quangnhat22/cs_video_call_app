import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:videocall/domain/entities/group_entity.dart';
import 'package:videocall/domain/entities/user_entity.dart';
import 'package:videocall/domain/modules/search/search_usecase.dart';

part 'global_search_bloc.freezed.dart';
part 'global_search_event.dart';
part 'global_search_state.dart';

@Injectable()
class GlobalSearchBloc extends Bloc<GlobalSearchEvent, GlobalSearchState> {
  GlobalSearchBloc({required SearchUseCase searchUseCase})
      : _searchUseCase = searchUseCase,
        super(const _Initial()) {
    on<GlobalSearchEvent>((event, emit) async {
      await event.map(
          searchInputChanging: (event) => _searchInputChanging(event, emit));
    }, transformer: _debounce(const Duration(milliseconds: 500)));
  }

  final SearchUseCase _searchUseCase;

  Future<void> _searchInputChanging(
      GlobalSearchChanging event, Emitter<GlobalSearchState> emit) async {
    try {
      emit(const GlobalSearchState.getResultInProgress());

      final searchResult = await _searchUseCase.searchGlobally(event.query);

      emit(GlobalSearchState.getResultSuccess(
        friends: searchResult?.friends,
        groups: searchResult?.groups,
      ));
    } catch (e) {
      emit(GetSearchResultFailed(message: e.toString()));
    }
  }

  EventTransformer<E> _debounce<E>(Duration duration) {
    return (events, mapper) {
      return events.debounce(duration).switchMap(mapper);
    };
  }
}
