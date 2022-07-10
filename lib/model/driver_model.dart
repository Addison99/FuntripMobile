// deprecated: Redundant model only use for register
import 'package:json_annotation/json_annotation.dart';

part 'driver_model.g.dart';

@JsonSerializable()
class DriverModel {
  int? id;
  String? userName;
  String? password;
  String? gmail;

  DriverModel({this.id, this.userName, this.password, this.gmail}) {}

  factory DriverModel.fromJson(Map<String, dynamic> json) =>
      _$DriverModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$DriverModelToJson(this);
}
