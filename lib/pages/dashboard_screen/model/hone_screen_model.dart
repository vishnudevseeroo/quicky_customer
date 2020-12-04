import 'package:json_annotation/json_annotation.dart';

import 'address_list_model.dart';
import 'category_list.dart';
import 'city_list_model.dart';
import 'featured_list_model.dart';
part 'hone_screen_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DashboardModel {
  String phone;
  String name;
  String email;

  List<AddressList> address;

  @JsonKey(name: 'city_list')
  List<CityList> cityList;

  @JsonKey(name: 'business_categories')
  List<CategoryList> businessCategories;

  @JsonKey(name: 'featured_business')
  List<FeaturedBusiness> featuredBusiness;

  DashboardModel(
      {this.phone,
      this.name,
      this.email,
      this.address,
      this.cityList,
      this.businessCategories,
      this.featuredBusiness});

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);
}
