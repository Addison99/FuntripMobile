import 'package:json_annotation/json_annotation.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel {
  int? id;
  String? vehicleName;
  String? manufacturer;
  int? categoryId;
  int? groupId;
  String? address;
  double? cost;
  String? status;
  String? img;
  int? driverId;
  String? driverName;
  DateTime? startTime;
  DateTime? endTime;

  BookingModel(
      {this.id,
      this.vehicleName,
      this.manufacturer,
      this.categoryId,
      this.groupId,
      this.status,
      this.cost,
      this.address,
      this.driverId,
      this.driverName,
      this.startTime,
      this.endTime,
      this.img}) {}

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}
