part of 'global_search_bloc.dart';

@freezed
class GlobalSearchState with _$GlobalSearchState {
  const factory GlobalSearchState.initial() = _Initial;

  const factory GlobalSearchState.getResultInProgress() =
      GetSearchResultInProgress;

  const factory GlobalSearchState.getResultSuccess(
      {required List<UserModel>? friends}) = GetSearchResultSuccess;

  const factory GlobalSearchState.getResultFailed({required String message}) =
      GetSearchResultFailed;
}
