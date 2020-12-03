import 'package:json_annotation/json_annotation.dart';
part 'otp_model.g.dart';

@JsonSerializable()
class OtpModel {
  String token;
  String category;

  @JsonKey(name: 'user_id')
  int userId;

  @JsonKey(name: 'profile_complete_status')
  @JsonKey(defaultValue: false)
  bool profileStatus;

  OtpModel({this.token, this.category, this.userId, this.profileStatus});

  factory OtpModel.fromJson(Map<String, dynamic> json) =>
      _$OtpModelFromJson(json);

  Map<String, dynamic> toJson() => _$OtpModelToJson(this);
}

// "token": "73b9a37c8961bbe2f9d5a184bf879126bc97924e",
// "user_id": 43,
// "category": "Customer",
// "profile_complete_status": false
