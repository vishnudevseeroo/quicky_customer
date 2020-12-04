import 'package:json_annotation/json_annotation.dart';

part 'featured_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FeaturedBusiness {
  String ex;
  FeaturedBusiness({this.ex});

  factory FeaturedBusiness.fromJson(Map<String, dynamic> json) =>
      _$FeaturedBusinessFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturedBusinessToJson(this);
}
