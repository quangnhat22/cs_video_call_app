// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of welcome;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WelcomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInWithGoogleInProgress,
    required TResult Function() signInWithGoogleSuccess,
    required TResult Function(String? message) signInFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInWithGoogleInProgress,
    TResult? Function()? signInWithGoogleSuccess,
    TResult? Function(String? message)? signInFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInWithGoogleInProgress,
    TResult Function()? signInWithGoogleSuccess,
    TResult Function(String? message)? signInFail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(SignInWithGoogleInProgress value)
        signInWithGoogleInProgress,
    required TResult Function(SignInWithGoogleSuccess value)
        signInWithGoogleSuccess,
    required TResult Function(SignInFail value) signInFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(SignInWithGoogleInProgress value)?
        signInWithGoogleInProgress,
    TResult? Function(SignInWithGoogleSuccess value)? signInWithGoogleSuccess,
    TResult? Function(SignInFail value)? signInFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SignInWithGoogleInProgress value)?
        signInWithGoogleInProgress,
    TResult Function(SignInWithGoogleSuccess value)? signInWithGoogleSuccess,
    TResult Function(SignInFail value)? signInFail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WelcomeStateCopyWith<$Res> {
  factory $WelcomeStateCopyWith(
          WelcomeState value, $Res Function(WelcomeState) then) =
      _$WelcomeStateCopyWithImpl<$Res, WelcomeState>;
}

/// @nodoc
class _$WelcomeStateCopyWithImpl<$Res, $Val extends WelcomeState>
    implements $WelcomeStateCopyWith<$Res> {
  _$WelcomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$WelcomeStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'WelcomeState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInWithGoogleInProgress,
    required TResult Function() signInWithGoogleSuccess,
    required TResult Function(String? message) signInFail,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInWithGoogleInProgress,
    TResult? Function()? signInWithGoogleSuccess,
    TResult? Function(String? message)? signInFail,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInWithGoogleInProgress,
    TResult Function()? signInWithGoogleSuccess,
    TResult Function(String? message)? signInFail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(SignInWithGoogleInProgress value)
        signInWithGoogleInProgress,
    required TResult Function(SignInWithGoogleSuccess value)
        signInWithGoogleSuccess,
    required TResult Function(SignInFail value) signInFail,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(SignInWithGoogleInProgress value)?
        signInWithGoogleInProgress,
    TResult? Function(SignInWithGoogleSuccess value)? signInWithGoogleSuccess,
    TResult? Function(SignInFail value)? signInFail,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SignInWithGoogleInProgress value)?
        signInWithGoogleInProgress,
    TResult Function(SignInWithGoogleSuccess value)? signInWithGoogleSuccess,
    TResult Function(SignInFail value)? signInFail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements WelcomeState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$SignInWithGoogleInProgressCopyWith<$Res> {
  factory _$$SignInWithGoogleInProgressCopyWith(
          _$SignInWithGoogleInProgress value,
          $Res Function(_$SignInWithGoogleInProgress) then) =
      __$$SignInWithGoogleInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInWithGoogleInProgressCopyWithImpl<$Res>
    extends _$WelcomeStateCopyWithImpl<$Res, _$SignInWithGoogleInProgress>
    implements _$$SignInWithGoogleInProgressCopyWith<$Res> {
  __$$SignInWithGoogleInProgressCopyWithImpl(
      _$SignInWithGoogleInProgress _value,
      $Res Function(_$SignInWithGoogleInProgress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInWithGoogleInProgress implements SignInWithGoogleInProgress {
  const _$SignInWithGoogleInProgress();

  @override
  String toString() {
    return 'WelcomeState.signInWithGoogleInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInWithGoogleInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInWithGoogleInProgress,
    required TResult Function() signInWithGoogleSuccess,
    required TResult Function(String? message) signInFail,
  }) {
    return signInWithGoogleInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInWithGoogleInProgress,
    TResult? Function()? signInWithGoogleSuccess,
    TResult? Function(String? message)? signInFail,
  }) {
    return signInWithGoogleInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInWithGoogleInProgress,
    TResult Function()? signInWithGoogleSuccess,
    TResult Function(String? message)? signInFail,
    required TResult orElse(),
  }) {
    if (signInWithGoogleInProgress != null) {
      return signInWithGoogleInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(SignInWithGoogleInProgress value)
        signInWithGoogleInProgress,
    required TResult Function(SignInWithGoogleSuccess value)
        signInWithGoogleSuccess,
    required TResult Function(SignInFail value) signInFail,
  }) {
    return signInWithGoogleInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(SignInWithGoogleInProgress value)?
        signInWithGoogleInProgress,
    TResult? Function(SignInWithGoogleSuccess value)? signInWithGoogleSuccess,
    TResult? Function(SignInFail value)? signInFail,
  }) {
    return signInWithGoogleInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SignInWithGoogleInProgress value)?
        signInWithGoogleInProgress,
    TResult Function(SignInWithGoogleSuccess value)? signInWithGoogleSuccess,
    TResult Function(SignInFail value)? signInFail,
    required TResult orElse(),
  }) {
    if (signInWithGoogleInProgress != null) {
      return signInWithGoogleInProgress(this);
    }
    return orElse();
  }
}

abstract class SignInWithGoogleInProgress implements WelcomeState {
  const factory SignInWithGoogleInProgress() = _$SignInWithGoogleInProgress;
}

/// @nodoc
abstract class _$$SignInWithGoogleSuccessCopyWith<$Res> {
  factory _$$SignInWithGoogleSuccessCopyWith(_$SignInWithGoogleSuccess value,
          $Res Function(_$SignInWithGoogleSuccess) then) =
      __$$SignInWithGoogleSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInWithGoogleSuccessCopyWithImpl<$Res>
    extends _$WelcomeStateCopyWithImpl<$Res, _$SignInWithGoogleSuccess>
    implements _$$SignInWithGoogleSuccessCopyWith<$Res> {
  __$$SignInWithGoogleSuccessCopyWithImpl(_$SignInWithGoogleSuccess _value,
      $Res Function(_$SignInWithGoogleSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInWithGoogleSuccess implements SignInWithGoogleSuccess {
  const _$SignInWithGoogleSuccess();

  @override
  String toString() {
    return 'WelcomeState.signInWithGoogleSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInWithGoogleSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInWithGoogleInProgress,
    required TResult Function() signInWithGoogleSuccess,
    required TResult Function(String? message) signInFail,
  }) {
    return signInWithGoogleSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInWithGoogleInProgress,
    TResult? Function()? signInWithGoogleSuccess,
    TResult? Function(String? message)? signInFail,
  }) {
    return signInWithGoogleSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInWithGoogleInProgress,
    TResult Function()? signInWithGoogleSuccess,
    TResult Function(String? message)? signInFail,
    required TResult orElse(),
  }) {
    if (signInWithGoogleSuccess != null) {
      return signInWithGoogleSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(SignInWithGoogleInProgress value)
        signInWithGoogleInProgress,
    required TResult Function(SignInWithGoogleSuccess value)
        signInWithGoogleSuccess,
    required TResult Function(SignInFail value) signInFail,
  }) {
    return signInWithGoogleSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(SignInWithGoogleInProgress value)?
        signInWithGoogleInProgress,
    TResult? Function(SignInWithGoogleSuccess value)? signInWithGoogleSuccess,
    TResult? Function(SignInFail value)? signInFail,
  }) {
    return signInWithGoogleSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SignInWithGoogleInProgress value)?
        signInWithGoogleInProgress,
    TResult Function(SignInWithGoogleSuccess value)? signInWithGoogleSuccess,
    TResult Function(SignInFail value)? signInFail,
    required TResult orElse(),
  }) {
    if (signInWithGoogleSuccess != null) {
      return signInWithGoogleSuccess(this);
    }
    return orElse();
  }
}

abstract class SignInWithGoogleSuccess implements WelcomeState {
  const factory SignInWithGoogleSuccess() = _$SignInWithGoogleSuccess;
}

/// @nodoc
abstract class _$$SignInFailCopyWith<$Res> {
  factory _$$SignInFailCopyWith(
          _$SignInFail value, $Res Function(_$SignInFail) then) =
      __$$SignInFailCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$SignInFailCopyWithImpl<$Res>
    extends _$WelcomeStateCopyWithImpl<$Res, _$SignInFail>
    implements _$$SignInFailCopyWith<$Res> {
  __$$SignInFailCopyWithImpl(
      _$SignInFail _value, $Res Function(_$SignInFail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$SignInFail(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SignInFail implements SignInFail {
  const _$SignInFail(this.message);

  @override
  final String? message;

  @override
  String toString() {
    return 'WelcomeState.signInFail(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInFail &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInFailCopyWith<_$SignInFail> get copyWith =>
      __$$SignInFailCopyWithImpl<_$SignInFail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInWithGoogleInProgress,
    required TResult Function() signInWithGoogleSuccess,
    required TResult Function(String? message) signInFail,
  }) {
    return signInFail(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInWithGoogleInProgress,
    TResult? Function()? signInWithGoogleSuccess,
    TResult? Function(String? message)? signInFail,
  }) {
    return signInFail?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInWithGoogleInProgress,
    TResult Function()? signInWithGoogleSuccess,
    TResult Function(String? message)? signInFail,
    required TResult orElse(),
  }) {
    if (signInFail != null) {
      return signInFail(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(SignInWithGoogleInProgress value)
        signInWithGoogleInProgress,
    required TResult Function(SignInWithGoogleSuccess value)
        signInWithGoogleSuccess,
    required TResult Function(SignInFail value) signInFail,
  }) {
    return signInFail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(SignInWithGoogleInProgress value)?
        signInWithGoogleInProgress,
    TResult? Function(SignInWithGoogleSuccess value)? signInWithGoogleSuccess,
    TResult? Function(SignInFail value)? signInFail,
  }) {
    return signInFail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SignInWithGoogleInProgress value)?
        signInWithGoogleInProgress,
    TResult Function(SignInWithGoogleSuccess value)? signInWithGoogleSuccess,
    TResult Function(SignInFail value)? signInFail,
    required TResult orElse(),
  }) {
    if (signInFail != null) {
      return signInFail(this);
    }
    return orElse();
  }
}

abstract class SignInFail implements WelcomeState {
  const factory SignInFail(final String? message) = _$SignInFail;

  String? get message;
  @JsonKey(ignore: true)
  _$$SignInFailCopyWith<_$SignInFail> get copyWith =>
      throw _privateConstructorUsedError;
}
