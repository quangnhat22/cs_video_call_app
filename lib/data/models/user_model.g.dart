// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      address: json['address'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      birthday: json['birthday'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'address': instance.address,
      'gender': instance.gender,
      'phone': instance.phone,
      'birthday': instance.birthday,
    };
