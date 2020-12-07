
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'dart:convert';


import 'package:quicky_customer/pages/login/models/login_model.dart';
import 'package:quicky_customer/pages/profile/add_profile/add_profile_model.dart';
import 'package:quicky_customer/pages/verificationOtp/model/otp_model.dart';
import 'package:quicky_customer/utils/constants.dart';
import 'package:quicky_customer/pages/select_city/models/citylist.dart';

final String baseUrl = 'https://seerooquicky.herokuapp.com';


// final String baseUrl = 'https://api.bigcommerce.com/stores/8ybalj1wm9/v3';


Map<String, String> headers() => {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization":
          "Token ${SharedPrefs.getTocken() ?? "ee18ddbd1eee28b8265f5f7b32a3e30052c4904f"}",
    };

Future<LoginResponse> verifyPasswordFor({String phone}) async {
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
  final response = await http.post('$baseUrl/api/customer/verifyotp/',
      headers: headers(),
      body: jsonEncode(<String, String>{"phone": phone, "otp": otp}));
  print('verify pswd resp: ${response.statusCode}: ${response.body}');
  if (response.statusCode == 200) {
    return OtpModel.fromJson(json.decode(response.body));
  } else {
    return OtpModel();
  }
}

Future<ProfileModel> addProfileDetails(
    {String userId, String name, String email}) async {
  final response = await http.post('$baseUrl/api/customer/updateprofile/',
      headers: headers(),
      body: jsonEncode(
          <String, String>{"user_id": userId, "name": name, "email": email}));
  print('verify pswd resp: ${response.statusCode}: ${response.body}');
  if (response.statusCode == 200) {
    return ProfileModel.fromJson(json.decode(response.body));
  } else {
    return ProfileModel();
  }
}

// Future<String> verifyPasswordFor(
//     {int customerID, String password}) async {
// //  uses v2 api. deprecated
//   print(
//       'https://api.bigcommerce.com/stores/8ybalj1wm9/v2/customers/$customerID/validate');
//   final response = await http.post(
//       'https://api.bigcommerce.com/stores/8ybalj1wm9/v2/customers/$customerID/validate',
//       headers: headers(),
//       body: jsonEncode(<String, String>{"password": password}));
//   print('verify pswd resp: ${response.statusCode}: ${response.body}');
//   if (response.statusCode == 200) {
//     return VerifyPasswordResponse.fromJson(json.decode(response.body));
//   } else {
//     return VerifyPasswordResponse(responseSuccess: false);
//   }
// }

Future<List<CityList>> getAllList() async {
  final response = await http.get('$baseUrl/api/business/citylist/',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Token 73b9a37c8961bbe2f9d5a184bf879126bc97924e",
    },
  );
  print('list response: ${response.statusCode} : ${response.body}');
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return List<CityList>.from(
        jsonData.map((x) => CityList.fromJson(x)));
//     return CityList.fromJson(json.decode(response.body[0]));
  } else {
    throw Exception('Failed to retrieve list items');
  }
}


// Future<List<CartProductDetails>> getOrderProductsList({String url}) async {
//   final response = await http.get(url, headers: headers());
//   print('Order products list: ${response.statusCode} : ${response.body}');
//
//   if (response.statusCode >= 200 && response.statusCode <= 299) {
//     final jsonData = json.decode(response.body);
//     return List<CartProductDetails>.from(
//         jsonData.map((x) => CartProductDetails.fromJson(x)));
//   } else {
//     throw Exception('Order products List fetch failed');
//   }
// }




// Token 73b9a37c8961bbe2f9d5a184bf879126bc97924e

