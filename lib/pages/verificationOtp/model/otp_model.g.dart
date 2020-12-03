// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpModel _$OtpModelFromJson(Map<String, dynamic> json) {
  return OtpModel(
    token: json['token'] as String,
    category: json['category'] as String,
    userId: json['user_id'] as int,
    profileStatus: json['profile_complete_status'] as bool,
  );
}

Map<String, dynamic> _$OtpModelToJson(OtpModel instance) => <String, dynamic>{
      'token': instance.token,
      'category': instance.category,
      'user_id': instance.userId,
      'profile_complete_status': instance.profileStatus,
    };
