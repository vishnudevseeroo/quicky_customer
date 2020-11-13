import 'dart:io' show Platform;
import 'package:shared_preferences/shared_preferences.dart';

final int quantitySelectionType = 2; // 1: Textfield 2: Dropdown

bool validateStructureForPassword(String value) {
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{7,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}

// class SharedPreffUtil {
//   final registerKey = 'register_complete';
//   final loginKey = 'login';
//   final isEngSelectedKey = 'is_english_selected';
//   final mobileKey = 'mobile';

//   static final SharedPreffUtil _instance = SharedPreffUtil._ctor();

//   factory SharedPreffUtil() {
//     return _instance;
//   }

//   SharedPreffUtil._ctor();

//   SharedPreferences _prefs;

//   init() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   set setLogin(bool login) {
//     _prefs.setBool(loginKey, login);
//   }

//   get isLoggedin {
//     return _prefs.getBool(loginKey) ?? false;
//   }

//   set setRegistrationComplete(bool login) {
//     _prefs.setBool(registerKey, login);
//   }

//   get isRegister {
//     return _prefs.getBool(registerKey) ?? false;
//   }

//   set setLanguageAsEnglish(bool login) {
//     _prefs.setBool(isEngSelectedKey, login);
//   }

//   get isEnglishSelected {
//     return _prefs.getBool(isEngSelectedKey) ?? false;
//   }

//   set setMobileNumber(String mobile) {
//     _prefs.setString(mobileKey, mobile);
//   }

//   get getMobile {
//     return _prefs.getString(mobileKey);
//   }
// }

class SharedPrefs {
  static SharedPreferences shared;

  static void setUserId(int userId) {
    shared.setInt('user_id', userId);
  }

  static int getUserId() {
    return shared.getInt('user_id') ?? 1;
  }

  static bool isLoggedIn() {
    return shared.getBool('loggedIn') ?? false;
  }

  static void setisLoggedIn(bool status) {
    shared.setBool('loggedIn', status);
  }
}
