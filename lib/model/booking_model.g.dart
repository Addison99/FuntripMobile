// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      id: json['id'] as int?,
      vehicleName: json['vehicleName'] as String?,
      manufacturer: json['manufacturer'] as String?,
      categoryId: json['categoryId'] as int?,
      groupId: json['groupId'] as int?,
      status: json['status'] as String?,
      cost: (json['cost'] as num?)?.toDouble(),
      address: json['address'] as String?,
      driverId: json['driverId'] as int?,
      driverName: json['driverName'] as String?,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      img: json['img'] as String?,
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleName': instance.vehicleName,
      'manufacturer': instance.manufacturer,
      'categoryId': instance.categoryId,
      'groupId': instance.groupId,
      'address': instance.address,
      'cost': instance.cost,
      'status': instance.status,
      'img': instance.img,
      'driverId': instance.driverId,
      'driverName': instance.driverName,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
    };
