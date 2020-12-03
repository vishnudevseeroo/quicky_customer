// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    status: json['status'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'email': instance.email,
      'message': instance.message,
    };
