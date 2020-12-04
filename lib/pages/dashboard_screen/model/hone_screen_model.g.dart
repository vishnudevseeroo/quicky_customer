// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hone_screen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) {
  return DashboardModel(
    phone: json['phone'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    address: (json['address'] as List)
        ?.map((e) =>
            e == null ? null : AddressList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cityList: (json['city_list'] as List)
        ?.map((e) =>
            e == null ? null : CityList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    businessCategories: (json['business_categories'] as List)
        ?.map((e) =>
            e == null ? null : CategoryList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    featuredBusiness: (json['featured_business'] as List)
        ?.map((e) => e == null
            ? null
            : FeaturedBusiness.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address?.map((e) => e?.toJson())?.toList(),
      'city_list': instance.cityList?.map((e) => e?.toJson())?.toList(),
      'business_categories':
          instance.businessCategories?.map((e) => e?.toJson())?.toList(),
      'featured_business':
          instance.featuredBusiness?.map((e) => e?.toJson())?.toList(),
    };
