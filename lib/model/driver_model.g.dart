// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverModel _$DriverModelFromJson(Map<String, dynamic> json) => DriverModel(
      id: json['id'] as int?,
      userName: json['userName'] as String?,
      password: json['password'] as String?,
      gmail: json['gmail'] as String?,
    );

Map<String, dynamic> _$DriverModelToJson(DriverModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'password': instance.password,
      'gmail': instance.gmail,
    };
