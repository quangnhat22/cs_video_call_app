import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:videocall/data/models/user_model.dart';
import 'package:videocall/domain/modules/search/search_usecase.dart';
import 'package:injectable/injectable.dart';

part 'global_search_event.dart';
part 'global_search_state.dart';
part 'global_search_bloc.freezed.dart';

@Injectable()
class GlobalSearchBloc extends Bloc<GlobalSearchEvent, GlobalSearchState> {
  GlobalSearchBloc({required SearchUseCase searchUseCase})
      : _searchUseCase = searchUseCase,
        super(const _Initial()) {
    on<GlobalSearchEvent>((event, emit) async {
      await event.map(
          searchInputChanging: (event) => _searchInputChanging(event, emit));
    });
  }

  final SearchUseCase _searchUseCase;

  Future<void> _searchInputChanging(
      GlobalSearchChanging event, Emitter<GlobalSearchState> emit) async {
    try {
      emit(const GlobalSearchState.getResultInProgress());

      final friendsResult = await _searchUseCase.searchGlobally(event.query);

      emit(GlobalSearchState.getResultSuccess(friends: friendsResult?.friends));
    } catch (e) {
      emit(GetSearchResultFailed(message: e.toString()));
    }
  }
}
