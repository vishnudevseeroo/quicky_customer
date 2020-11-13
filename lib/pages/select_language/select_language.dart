import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quicky_customer/main.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/localization/language_constants.dart';
import 'package:quicky_customer/pages/login/login.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';
import 'package:quicky_customer/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectLanguageScreen extends StatefulWidget {
  static const routeName = '/selectlanguage';
  bool isFromSplashScreen = false;

  SelectLanguageScreen({bool isFromSplashScreen}) {
    this.isFromSplashScreen = isFromSplashScreen;
  }

  @override
  SelectLanguageState createState() =>
      SelectLanguageState(this.isFromSplashScreen);
}

class SelectLanguageState extends State<SelectLanguageScreen> {
  bool isFromSplashScreen = false;

  SelectLanguageState(bool isFromSplashScreen) {
    this.isFromSplashScreen = isFromSplashScreen;
  }

  bool _newValueENG = false;

  String isEnglishSelected = "";

  @override
  void initState() {
    super.initState();
    _fetchLanguage();
  }

  _fetchLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = (prefs.getString(LAGUAGE_CODE) ?? 'en');
    print(languageCode);

    setState(() {
      switch (languageCode) {
        case ENGLISH:
          _newValueENG = true;

          break;
        case MALAYALAM:
          _newValueENG = false;

          break;
      }
    });
  }

  void _changeLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(LAGUAGE_CODE, languageCode);
    Locale locale;
    switch (languageCode) {
      case ENGLISH:
        locale = Locale(languageCode, 'US');
        break;
      case MALAYALAM:
        locale = Locale(languageCode, 'IN');
        break;
    }
    MyHomePage.setLocale(context, locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: generateContentLayout(context),
        ));
  }

  Widget generateContentLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Column(
            children: [
              Text(buildTranslate(context, 'select'),
                  style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: heading1))
            ],
          ),
        ),
        languageSelectionLayout(),
        FlatButton(
            height: 70,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            shape: new CircleBorder(),
            color: Colors.white,
            child: Icon(Icons.arrow_forward))
      ],
    );
  }

  Widget languageSelectionLayout() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Text(
                    buildTranslate(context, 'english'),
                    style: TextStyle(color: Colors.white, fontSize: normalSize),
                  ),
                  onTap: () {
                    _newValueENG = true;
                    _changeLanguage(ENGLISH);

                    print('English');
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                _newValueENG
                    ? Image.asset('assets/images/tick.png')
                    : Container()
              ],
            ),
          ),
          SizedBox(
            width: 150,
            child: Divider(
              thickness: 1.5,
              height: 40,
              color: Colors.white60,
            ),
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    print('vak  ------ ');
                    _newValueENG = false;
                    _changeLanguage(MALAYALAM);
                  },
                  child: Text(
                    buildTranslate(context, 'malayalam'),
                    style: TextStyle(color: Colors.white, fontSize: normalSize),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                if (!_newValueENG) Image.asset('assets/images/tick.png')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
