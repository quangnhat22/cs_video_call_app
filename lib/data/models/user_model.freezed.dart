// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get avatar => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get email => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get phone => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get gender => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get bio => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime? get birthday => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get relation => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: "common_friend_count", ignore: true)
  int? get commonFriendCount =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "is_friend", ignore: true)
  bool? get isFriend =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "last_seen_at", ignore: true)
  DateTime? get lastSeenAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          String? name,
      @HiveField(2)
          String? avatar,
      @HiveField(3)
          String? email,
      @HiveField(4)
          String? phone,
      @HiveField(5)
          String? gender,
      @HiveField(6)
          String? bio,
      @HiveField(7)
          DateTime? birthday,
      @HiveField(8)
          String? relation,
      @HiveField(9)
      @JsonKey(name: "common_friend_count", ignore: true)
          int? commonFriendCount,
      @JsonKey(name: "is_friend", ignore: true)
          bool? isFriend,
      @JsonKey(name: "last_seen_at", ignore: true)
          DateTime? lastSeenAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? bio = freezed,
    Object? birthday = freezed,
    Object? relation = freezed,
    Object? commonFriendCount = freezed,
    Object? isFriend = freezed,
    Object? lastSeenAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      relation: freezed == relation
          ? _value.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as String?,
      commonFriendCount: freezed == commonFriendCount
          ? _value.commonFriendCount
          : commonFriendCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isFriend: freezed == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastSeenAt: freezed == lastSeenAt
          ? _value.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          String? name,
      @HiveField(2)
          String? avatar,
      @HiveField(3)
          String? email,
      @HiveField(4)
          String? phone,
      @HiveField(5)
          String? gender,
      @HiveField(6)
          String? bio,
      @HiveField(7)
          DateTime? birthday,
      @HiveField(8)
          String? relation,
      @HiveField(9)
      @JsonKey(name: "common_friend_count", ignore: true)
          int? commonFriendCount,
      @JsonKey(name: "is_friend", ignore: true)
          bool? isFriend,
      @JsonKey(name: "last_seen_at", ignore: true)
          DateTime? lastSeenAt});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? bio = freezed,
    Object? birthday = freezed,
    Object? relation = freezed,
    Object? commonFriendCount = freezed,
    Object? isFriend = freezed,
    Object? lastSeenAt = freezed,
  }) {
    return _then(_$_UserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      relation: freezed == relation
          ? _value.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as String?,
      commonFriendCount: freezed == commonFriendCount
          ? _value.commonFriendCount
          : commonFriendCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isFriend: freezed == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastSeenAt: freezed == lastSeenAt
          ? _value.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  _$_UserModel(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          this.name,
      @HiveField(2)
          this.avatar,
      @HiveField(3)
          this.email,
      @HiveField(4)
          this.phone,
      @HiveField(5)
          this.gender,
      @HiveField(6)
          this.bio,
      @HiveField(7)
          this.birthday,
      @HiveField(8)
          this.relation,
      @HiveField(9)
      @JsonKey(name: "common_friend_count", ignore: true)
          this.commonFriendCount,
      @JsonKey(name: "is_friend", ignore: true)
          this.isFriend,
      @JsonKey(name: "last_seen_at", ignore: true)
          this.lastSeenAt});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String? name;
  @override
  @HiveField(2)
  final String? avatar;
  @override
  @HiveField(3)
  final String? email;
  @override
  @HiveField(4)
  final String? phone;
  @override
  @HiveField(5)
  final String? gender;
  @override
  @HiveField(6)
  final String? bio;
  @override
  @HiveField(7)
  final DateTime? birthday;
  @override
  @HiveField(8)
  final String? relation;
  @override
  @HiveField(9)
  @JsonKey(name: "common_friend_count", ignore: true)
  final int? commonFriendCount;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "is_friend", ignore: true)
  final bool? isFriend;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "last_seen_at", ignore: true)
  final DateTime? lastSeenAt;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, avatar: $avatar, email: $email, phone: $phone, gender: $gender, bio: $bio, birthday: $birthday, relation: $relation, commonFriendCount: $commonFriendCount, isFriend: $isFriend, lastSeenAt: $lastSeenAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.relation, relation) ||
                other.relation == relation) &&
            (identical(other.commonFriendCount, commonFriendCount) ||
                other.commonFriendCount == commonFriendCount) &&
            (identical(other.isFriend, isFriend) ||
                other.isFriend == isFriend) &&
            (identical(other.lastSeenAt, lastSeenAt) ||
                other.lastSeenAt == lastSeenAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatar, email, phone,
      gender, bio, birthday, relation, commonFriendCount, isFriend, lastSeenAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {@HiveField(0)
          required final String id,
      @HiveField(1)
          final String? name,
      @HiveField(2)
          final String? avatar,
      @HiveField(3)
          final String? email,
      @HiveField(4)
          final String? phone,
      @HiveField(5)
          final String? gender,
      @HiveField(6)
          final String? bio,
      @HiveField(7)
          final DateTime? birthday,
      @HiveField(8)
          final String? relation,
      @HiveField(9)
      @JsonKey(name: "common_friend_count", ignore: true)
          final int? commonFriendCount,
      @JsonKey(name: "is_friend", ignore: true)
          final bool? isFriend,
      @JsonKey(name: "last_seen_at", ignore: true)
          final DateTime? lastSeenAt}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String? get name;
  @override
  @HiveField(2)
  String? get avatar;
  @override
  @HiveField(3)
  String? get email;
  @override
  @HiveField(4)
  String? get phone;
  @override
  @HiveField(5)
  String? get gender;
  @override
  @HiveField(6)
  String? get bio;
  @override
  @HiveField(7)
  DateTime? get birthday;
  @override
  @HiveField(8)
  String? get relation;
  @override
  @HiveField(9)
  @JsonKey(name: "common_friend_count", ignore: true)
  int? get commonFriendCount;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: "is_friend", ignore: true)
  bool? get isFriend;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: "last_seen_at", ignore: true)
  DateTime? get lastSeenAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
