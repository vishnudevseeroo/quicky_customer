import 'package:json_annotation/json_annotation.dart';

part 'address_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressList {
  String ex;
  AddressList({this.ex});

  factory AddressList.fromJson(Map<String, dynamic> json) =>
      _$AddressListFromJson(json);

  Map<String, dynamic> toJson() => _$AddressListToJson(this);
}
