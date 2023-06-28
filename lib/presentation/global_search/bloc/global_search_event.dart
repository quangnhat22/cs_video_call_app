part of 'global_search_bloc.dart';

@freezed
class GlobalSearchEvent with _$GlobalSearchEvent {
  const factory GlobalSearchEvent.searchInputChanging({required String query}) =
      GlobalSearchChanging;
}
