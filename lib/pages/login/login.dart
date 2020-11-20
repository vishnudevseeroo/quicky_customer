import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/verificationOtp/verification_otp.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginScreen> {
  final _controller = TextEditingController();

  final _emailController = TextEditingController();
  bool isShowErrorMsg = false;
  String errorMsg = "";
  DateTime currentBackPressTime;
  bool _isShowProgressBar = false;
  bool _isEnableLoginButton = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SafeArea(
              child: SingleChildScrollView(child: Center(child: loginLayout())),
            ),
          )),
    );
  }

  Widget loginLayout() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 30, right: 30),
      // width: double.infinity,
      // height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Image.asset(
            'assets/images/logo.png',
            width: 170,
            height: 170,
          ),
          SizedBox(
            height: 60,
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  buildTranslate(context, 'login'),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: heading2,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              commonEditTextForMobile(
                  context: context,
                  labelName: buildTranslate(context, 'mobile_number'),
                  inputType: TextInputType.phone,
                  maxLength: 10,
                  controller: _controller,
                  isShowValidation: isShowErrorMsg,
                  errorMsg: errorMsg,
                  inputRestriction: FilteringTextInputFormatter.digitsOnly,
                  valueSubmitted: (value) {
                    print(value);
                  },
                  onClicked: () {
                    setState(() {
                      isShowErrorMsg = false;
                    });
                  }),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          commonRoungButtonGreen(buildTranslate(context, 'login'), () {
            // button action here
            _isEnableLoginButton ? validateFiled() : null;
          }, double.infinity),
          SizedBox(
            height: 50,
          ),
          _isShowProgressBar ? CircularProgressIndicator() : SizedBox()
        ],
      ),
    );
  }

  Future<bool> onBackPressed() {
    // SystemNavigator.pop();
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: buildTranslate(context, 'exit_msg'),
          textColor: Colors.white,
          backgroundColor: primaryColor);
      return Future.value(false);
    }
    SystemNavigator.pop();
    return Future.value(true);
  }

  loginApiCall() {
    print('login or register api call working........');

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OtpScreen()));

    //   ApiServices()
    //       .loginOrRegister(
    //           mobile: _controller.text,
    //           context: context,
    //           onError: () {
    //             desableProgressBar();
    //           })
    //       .then((response) => {
    //             if (response.status == "success")
    //               {
    //                 desableProgressBar(),
    //                 print("Login success " + response.oTP),
    //                 Fluttertoast.showToast(
    //                     msg: 'OTP:' + response.oTP,
    //                     toastLength: Toast.LENGTH_LONG),
    //                 Navigator.push(context,
    //                     MaterialPageRoute(builder: (context) => OtpScreen()))
    //               }
    //             else
    //               {
    //                 desableProgressBar(),
    //                 print("Failed to login.."),
    //                 Fluttertoast.showToast(
    //                     msg: getTranslated(context, 'error_msg'))
    //               }
    //           });
    // }

    // void desableProgressBar() {
    //   setState(() {
    //     _isShowProgressBar = false;
    //     _isEnableLoginButton = true;
    //   });
  }

  void validateFiled() {
    setState(() {
      if (_controller.text.isEmpty) {
        isShowErrorMsg = true;
        errorMsg = buildTranslate(context, 'enter_mobile_number');
      } else if (_controller.text.length < 10) {
        isShowErrorMsg = true;
        errorMsg = buildTranslate(context, 'enter_valid_mobile_number');
      } else {
        isShowErrorMsg = false;

        _isShowProgressBar = true;
        _isEnableLoginButton = false;
        loginApiCall();
      }
    });
  }
}
