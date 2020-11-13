import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:quicky_customer/main.dart';
import 'package:quicky_customer/pages/select_language/select_language.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';
import 'package:quicky_customer/utils/constants.dart';

class SpalshScreen extends StatefulWidget {
  static const routeName = '/splashscreen';
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SpalshScreen> {
  String versionNumber = "";

  @override
  void initState() {
    getVersionNumber();
    //SharedPreffUtil().init();
    Timer(
        Duration(seconds: 3),
        () => {
              // setLanguage(),
              // if (SharedPreffUtil().isLoggedin && SharedPreffUtil().isRegister)
              //   {
              //     Navigator.pushReplacement(
              //         context,
              //         MaterialPageRoute(
              //             builder: (BuildContext context) => DashboardScreen()))
              //   }
              // else if (!SharedPreffUtil().isRegister &&
              //     !SharedPreffUtil().isLoggedin)
              //   {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectLanguageScreen(
                            isFromSplashScreen: true,
                          )))
              //   }
              // else if (SharedPreffUtil().isRegister &&
              //     !SharedPreffUtil().isLoggedin)
              //   {
              //     Navigator.pushReplacement(context,
              //         MaterialPageRoute(builder: (context) => LoginScreen()))
              //}
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: contentLayout(),
    );
  }

  Widget contentLayout() {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: new DecorationImage(
          image: AssetImage('assets/images/splash.png'),
          fit: BoxFit.fill,
        )),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset('assets/images/logo.png'),
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  "V $versionNumber",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: normalSize,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }

  Future getVersionNumber() async {
    // String buildNumber = "";
    // PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    //   buildNumber = packageInfo.buildNumber;
    // });
    // print("version_number: $buildNumber");
    // return buildNumber;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionName = packageInfo.version;
    String versionCode = packageInfo.buildNumber;
    print("version_number: $versionCode");
    setState(() {
      versionNumber = versionName;
    });
  }
}
