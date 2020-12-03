import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'dart:convert';

final String baseUrl = 'https://api.bigcommerce.com/stores/8ybalj1wm9/v3';

Map<String, String> headers() => {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "X-Auth-Client": "b7mcgiqt9uqsbmnalr45w8tn1go2e9r",
      "X-Auth-Token": "p1f0538yexus8xivffafhmq63jk7zzp"
    };

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
