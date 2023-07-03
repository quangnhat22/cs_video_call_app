part of 'avatar_cubit.dart';

enum StatusUploadAvatar { initial, inProgress, success, fail }

@freezed
class AvatarState with _$AvatarState {
  const factory AvatarState.initial({
    String? urlImage,
    @Default(StatusUploadAvatar.initial) StatusUploadAvatar statusUpload,
  }) = _Initial;
}
