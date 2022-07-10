import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  static UserModel? currentUser;

  int? id;
  String? userName;
  String? password;
  String? email;
  int? roleId;
  String? status;

  UserModel(
      {this.id,
      this.userName,
      this.password,
      this.email,
      this.roleId,
      this.status}) {}

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
