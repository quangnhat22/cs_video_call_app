part of 'global_search_bloc.dart';

@freezed
class GlobalSearchState with _$GlobalSearchState {
  const factory GlobalSearchState.initial() = _Initial;

  const factory GlobalSearchState.getResultInProgress() =
      GetSearchResultInProgress;

  const factory GlobalSearchState.getResultSuccess({
    List<UserEntity>? friends,
    List<GroupEntity>? groups,
  }) = GetSearchResultSuccess;

  const factory GlobalSearchState.getResultFailed({required String message}) =
      GetSearchResultFailed;
}
