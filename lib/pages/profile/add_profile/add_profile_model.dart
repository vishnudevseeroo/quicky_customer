import 'package:json_annotation/json_annotation.dart';
part 'add_profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  String status;
  String name;
  String email;
  String message;

  ProfileModel({this.status, this.name, this.email, this.message});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
