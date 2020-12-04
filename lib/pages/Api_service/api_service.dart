import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:quicky_customer/pages/dashboard_screen/model/category_list.dart';
import 'package:quicky_customer/pages/dashboard_screen/model/hone_screen_model.dart';
import 'dart:convert';

import 'package:quicky_customer/pages/login/models/login_model.dart';
import 'package:quicky_customer/pages/profile/add_profile/add_profile_model.dart';
import 'package:quicky_customer/pages/verificationOtp/model/otp_model.dart';
import 'package:quicky_customer/utils/constants.dart';

final String baseUrl = 'https://seerooquicky.herokuapp.com';

Map<String, String> headers() => {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization":
          "Token ${SharedPrefs.getTocken() ?? "ee18ddbd1eee28b8265f5f7b32a3e30052c4904f"}",
    };

Future<LoginResponse> verifyPasswordFor({String phone}) async {
  print('verifyPasswordFor  phone:$phone ');
  final response = await http.post('$baseUrl/api/customer/register/',
      headers: headers(), body: jsonEncode(<String, String>{"phone": phone}));
  print(
      'verify pswd resp: ${response.statusCode}: ${response.body}  ${headers()} ');
  if (response.statusCode == 200) {
    return LoginResponse.fromJson(json.decode(response.body));
  } else {
    return LoginResponse();
  }
}

Future<OtpModel> verifyOtp({String phone, String otp}) async {
  print('verifyOtp  phone:$phone  otp:$otp');
  final response = await http.post('$baseUrl/api/customer/verifyotp/',
      headers: headers(),
      body: jsonEncode(<String, String>{"phone": phone, "otp": otp}));
  print(
      'verify verifyOtp: ${response.statusCode}: ${response.body}  ${headers()} ');
  if (response.statusCode == 200) {
    return OtpModel.fromJson(json.decode(response.body));
  } else {
    return OtpModel();
  }
}

Future<ProfileModel> addProfileDetails(
    {String userId, String name, String email}) async {
  print('add profile  id:$userId  name:$name  email:$email ');
  final response = await http.post('$baseUrl/api/customer/updateprofile/',
      headers: headers(),
      body: jsonEncode(
          <String, String>{"user_id": userId, "name": name, "email": email}));
  print(
      'verify verifyOtp: ${response.statusCode}: ${response.body}  ${headers()} ');

  if (response.statusCode == 200) {
    return ProfileModel.fromJson(json.decode(response.body));
  } else {
    return ProfileModel();
  }
}

Future<List<CategoryList>> categoryListApi({String userId}) async {
  print('categoryListApi  id:$userId');

  final response = await http.get(
      '$baseUrl/api/products/categorylist?user_id=$userId',
      headers: headers());
  print(
      'categoryListApi: ${response.statusCode}: ${response.body}  ${headers()} ');

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);

    return List<CategoryList>.from(
        jsonData.map((x) => CategoryList.fromJson(x)));
  } else {
    return List<CategoryList>();
  }
}

Future<DashboardModel> getHomeScreen({String userId}) async {
  print('add DashboardModel  id:$userId');
  final response = await http.post('$baseUrl/api/customer/home/',
      headers: headers(),
      body: jsonEncode(<String, String>{"user_id": userId}));
  print(
      'verify verifyOtp: ${response.statusCode}: ${response.body}  ${headers()} ');

  if (response.statusCode == 200) {
    return DashboardModel.fromJson(json.decode(response.body));
  } else {
    return DashboardModel();
  }
}
