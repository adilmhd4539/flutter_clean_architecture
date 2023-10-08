// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      message: json['message'] as String? ?? null,
      username: json['username'] as String? ?? null,
      id: json['id'] as int? ?? null,
      email: json['email'] as String? ?? null,
      firstName: json['firstName'] as String? ?? null,
      lastName: json['lastName'] as String? ?? null,
      gender: json['gender'] as String? ?? null,
      image: json['image'] as String? ?? null,
      token: json['token'] as String? ?? null,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'username': instance.username,
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'image': instance.image,
      'token': instance.token,
    };
