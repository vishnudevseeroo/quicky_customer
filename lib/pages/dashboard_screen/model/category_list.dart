import 'package:json_annotation/json_annotation.dart';
part 'category_list.g.dart';

@JsonSerializable()
class CategoryList {
  int id;
  String title;

  CategoryList(
    this.id,
    this.title,
  );

  factory CategoryList.fromJson(Map<String, dynamic> json) =>
      _$CategoryListFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListToJson(this);
}
