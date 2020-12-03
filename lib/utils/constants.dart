import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

final int quantitySelectionType = 2; // 1: Textfield 2: Dropdown

bool validateStructureForPassword(String value) {
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{7,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}

GlobalKey<NavigatorState> initialNavigator = GlobalKey<NavigatorState>();

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

  //tocken
  static void setTocken(String tocken) {
    shared.setString('tocken', tocken);
  }

  static String getTocken() {
    return shared.getString('tocken');
  }
}

bool isAddProduct = true;
