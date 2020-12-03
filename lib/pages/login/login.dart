import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quicky_customer/pages/Api_service/api_service.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/verificationOtp/verification_otp.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';
import 'package:quicky_customer/utils/snackbar.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginScreen> {
  final _controller = TextEditingController();

  bool isShowErrorMsg = false;
  String errorMsg = "";
  DateTime currentBackPressTime;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: ModalProgressHUD(
              inAsyncCall: isLoading,
              child: SafeArea(
                child:
                    SingleChildScrollView(child: Center(child: loginLayout())),
              ),
            ),
          )),
    );
  }

  Widget loginLayout() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 30, right: 30),
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
            validateFiled();
          }, double.infinity),
          SizedBox(
            height: 50,
          ),
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
    verifyPasswordFor(
      phone: _controller.text,
    ).then((response) {
      setState(() {
        isLoading = false;
      });
      if (response.status == "success") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OtpScreen(
                      phone: _controller.text,
                      message: response.message,
                      otp: response.otp,
                    )));
      } else {
        showSnackBar(scaffoldKey, response.message ?? 'Something went wrong');
      }
    });
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

        isLoading = true;
        // _isEnableLoginButton = false;
        loginApiCall();
      }
    });
  }
}
