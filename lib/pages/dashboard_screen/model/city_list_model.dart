import 'package:json_annotation/json_annotation.dart';

part 'city_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CityList {
  String ex;
  CityList({this.ex});

  factory CityList.fromJson(Map<String, dynamic> json) =>
      _$CityListFromJson(json);

  Map<String, dynamic> toJson() => _$CityListToJson(this);
}
