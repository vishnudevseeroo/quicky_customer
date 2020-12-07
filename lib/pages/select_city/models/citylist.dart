
import 'package:json_annotation/json_annotation.dart';
part 'citylist.g.dart';

@JsonSerializable()
class CityList {

  int id;
  String title;


  CityList(
      this.id,
      this.title,
      );



  factory CityList.fromJson(Map<String, dynamic> json) =>
      _$CityListFromJson(json);

  Map<String, dynamic> toJson() => _$CityListToJson(this);
}

