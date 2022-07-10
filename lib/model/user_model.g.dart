// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      userName: json['userName'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      roleId: json['roleId'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'password': instance.password,
      'email': instance.email,
      'roleId': instance.roleId,
      'status': instance.status,
    };
