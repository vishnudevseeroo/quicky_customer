import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/profile/profile.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/otpscreen';
  @override
  OtpState createState() => OtpState();
}

class OtpState extends State<OtpScreen> {
  bool isShowOtpValidation = false;
  String otpNumber = "";
  int countingTime = 59;
  String mobile = "9809003930";
  Timer _timer;
  bool _isResendEnable = false;
  bool _isShowProgressIndicator = false;
  bool _isButtonEnable = true;

  @override
  void initState() {
    startTimer();
    getSharedPrefValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Stack(
          children: [
            contentLayout(),
            _isShowProgressIndicator ? commonProgressIndicator() : SizedBox()
          ],
        ),
      ),
    );
  }

  Widget contentLayout() {
    return Column(
      children: [
        commonToolbar(context, "", true),
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
                if (_isButtonEnable) {
                  setState(() {
                    _isShowProgressIndicator = true;
                  });
                  validateOtp();
                }
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
                            validateOtp();
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
            _isShowProgressIndicator = false;
            _isButtonEnable = false;
          });
          Fluttertoast.showToast(
              msg: buildTranslate(context, 'no_network'),
              backgroundColor: primaryColor,
              textColor: Colors.white);
        }
      }
    });
  }

  Widget generateOtpPinView() {
    return SizedBox(
      width: 270,
      child: PinInputTextField(
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
    // String number = SharedPreffUtil().getMobile;
    String number = "9809003103";
    setState(() {
      mobile = number.substring(0, 3);
      mobile += "*****" + number.substring(8, 10);
      print(mobile);
    });
  }

  void callOtpApi() {
    setState(() {
      _isButtonEnable = false;
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileScreen()));

    // ApiServices().verifyOtp(
    //     mobile: SharedPreffUtil().getMobile,
    //     otp: otpNumber,
    //     context: context,
    //     onApiError: (error) {
    //       setState(() {
    //         _isShowProgressIndicator = false;
    //         _isButtonEnable = true;
    //       });
    //       Fluttertoast.showToast(msg: error);
    //     },
    //     onApiSuccess: (OtpResponse) {
    //       print('response=======> ' +
    //           OtpResponse.profileCompleteStatus.toString());
    //       setState(() {
    //         _isShowProgressIndicator = false;
    //         _isButtonEnable = true;
    //       });
    //       if (OtpResponse.profileCompleteStatus) {
    //         SharedPreffUtil().setLogin = true;
    //         Fluttertoast.showToast(
    //             msg: OtpResponse.message,
    //             backgroundColor: primaryColor,
    //             textColor: Colors.white);
    //         Navigator.push(context,
    //             MaterialPageRoute(builder: (context) => DashboardScreen()));
    //       } else {
    //         Fluttertoast.showToast(
    //             msg: OtpResponse.message,
    //             backgroundColor: primaryColor,
    //             textColor: Colors.white);
    //         Navigator.push(context,
    //             MaterialPageRoute(builder: (context) => CreateProfileScreen()));
    //       }
    //     });
  }
}
