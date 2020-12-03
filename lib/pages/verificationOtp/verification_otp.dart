import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:quicky_customer/pages/Api_service/api_service.dart';
import 'package:quicky_customer/pages/dashboard_screen/dashboard_screen.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/profile/profile.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';
import 'package:quicky_customer/utils/constants.dart';
import 'package:quicky_customer/utils/snackbar.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/otpscreen';

  final String phone;
  final String message;
  final String otp;

  OtpScreen({Key key, this.phone, this.message, this.otp}) : super(key: key);

  @override
  OtpState createState() => OtpState();
}

class OtpState extends State<OtpScreen> {
  bool isShowOtpValidation = false;
  String otpNumber = "";
  int countingTime = 59;
  String mobile = "";
  Timer _timer;
  bool _isResendEnable = false;
  bool _isShowProgressIndicator = false;
  bool _isButtonEnable = true;

  bool isLoading = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    mobile = widget.phone;
    startTimer();
    getSharedPrefValues();

    WidgetsBinding.instance.addPostFrameCallback(
        (_) => showSnackBar(scaffoldKey, '${widget.message} ${widget.otp} '));
  }

  void showInSnackBar(BuildContext context, String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SafeArea(
          child: Stack(
            children: [
              contentLayout(),
              // _isShowProgressIndicator ? commonProgressIndicator() : SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Widget contentLayout() {
    return Column(
      children: [
        commonToolbar(context, "otp", true),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset('assets/images/otp_image.png'),
              SizedBox(
                height: 50,
              ),
              Text(
                buildTranslate(context, 'verification_txt'),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: heading2),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                buildTranslate(context, 'otp_message') +
                    " " +
                    mobile.toString(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              generateOtpPinView(),
              SizedBox(
                height: 40,
              ),
              commonRoungButtonGreen(buildTranslate(context, 'verify_code'),
                  () {
// button click here

                validateOtp();
              }, 290),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _isResendEnable
                      ? GestureDetector(
                          onTap: () {
                            resendOtp();
                            setState(() {
                              _isResendEnable = false;
                              _isShowProgressIndicator = true;
                              _isButtonEnable = false;
                              startTimer();
                            });
                          },
                          child: Text(
                            buildTranslate(context, 'resend_code'),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: normalSize,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Text(
                          buildTranslate(context, 'resend_code?'),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: normalSize,
                              fontWeight: FontWeight.bold),
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  _isResendEnable
                      ? Text('')
                      : Text(
                          countingTime.toString(),
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: normalSize,
                              fontWeight: FontWeight.bold),
                        )
                ],
              )
            ],
          ),
        ))
      ],
    );
  }

  Future<void> resendOtp() async {
    bool _isNetWorkavailable = await getNetworkAvailability();
    if (_isNetWorkavailable) {
      setState(() {
        isLoading = true;
      });

      callResendOtp();
    } else {
      setState(() {
        isLoading = false;
        _isButtonEnable = false;
      });

      showSnackBar(scaffoldKey, buildTranslate(context, 'no_network'));
    }
  }

  void callResendOtp() {
    verifyPasswordFor(
      phone: widget.phone,
    ).then((response) {
      setState(() {
        isLoading = false;
      });
      if (response.status == "success") {
        showSnackBar(scaffoldKey, '${response.message} ${response.otp} ');
      } else {
        showSnackBar(scaffoldKey, response.message ?? 'Something went wrong');
      }
    });
  }

  Future<void> validateOtp() async {
    bool _isNetWorkavailable = await getNetworkAvailability();
    print('is_network_available: ' + _isNetWorkavailable.toString());
    setState(() {
      if (otpNumber.length < 4) {
        isShowOtpValidation = true;
      } else {
        isShowOtpValidation = false;
        if (_isNetWorkavailable) {
          callOtpApi();
        } else {
          setState(() {
            isLoading = false;
            _isButtonEnable = false;
          });

          showSnackBar(scaffoldKey, buildTranslate(context, 'no_network'));
        }
      }
    });
  }

  Widget generateOtpPinView() {
    return SizedBox(
      width: 270,
      child: PinInputTextField(
        inputFormatter: [FilteringTextInputFormatter.digitsOnly],
        pinLength: 6,
        decoration: BoxLooseDecoration(
            gapSpace: 5,
            errorText: isShowOtpValidation
                ? buildTranslate(context, 'otp_validation')
                : null,
            textStyle: TextStyle(fontSize: normalSize, color: Colors.black),
            strokeColorBuilder:
                PinListenColorBuilder(Colors.green, Colors.grey)),
        onChanged: (pin) {
          print("Otp: $pin");
          setState(() {
            pin.length == 6 ? FocusScope.of(context).unfocus() : null;
            isShowOtpValidation = false;
          });
          otpNumber = pin;
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    countingTime = 59;
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (countingTime < 1) {
            timer.cancel();
            setState(() {
              _isResendEnable = true;
            });
          } else {
            countingTime = countingTime - 1;
          }
        },
      ),
    );
  }

  Future<void> getSharedPrefValues() async {
    String number = widget.phone;
    setState(() {
      mobile = number.substring(0, 3);
      mobile += "*****" + number.substring(8, 10);
      print(mobile);
    });
  }

  void callOtpApi() {
    setState(() {
      isLoading = true;
    });

    verifyOtp(phone: widget.phone, otp: otpNumber).then((response) {
      setState(() {
        isLoading = false;
      });
      if (response.token != null) {
        SharedPrefs.setTocken(response.token);
        SharedPrefs.setUserId(response.userId);

        print(SharedPrefs.getTocken());
        if (response.profileStatus == true) {
          SharedPrefs.setisLoggedIn(true);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashboardScreen()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
        }
      } else {
        showSnackBar(scaffoldKey, 'Something went wrong');
      }
    });
  }
}
