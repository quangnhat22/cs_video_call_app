part of 'avatar_cubit.dart';

@freezed
class AvatarState with _$AvatarState {
  const factory AvatarState.initial() = _Initial;

  const factory AvatarState.updateAvatarInProgress() = UpdateAvatarInProgress;

  const factory AvatarState.updateAvatarSuccess() = UpdateAvatarSuccess;

  const factory AvatarState.updateAvatarFailure({required String message}) =
      UpdateAvatarFailure;

  const factory AvatarState.updateAvatarLocalSuccess({
    String? urlImage,
  }) = UpdateAvatarLocalSuccess;
}
