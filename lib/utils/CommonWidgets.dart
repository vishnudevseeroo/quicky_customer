import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';

import 'ColorUtil.dart';
import 'FontSizeUtil.dart';

Widget commonEditText(
    {@required BuildContext context,
    @required String labelName,
    @required TextInputType inputType,
    @required int maxLength,
    @required TextEditingController controller,
    @required bool isShowValidation,
    @required String errorMsg,
    FilteringTextInputFormatter inputRestriction,
    @required Function(String) valueSubmitted,
    @required Function onClicked}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.topLeft,
        child: Text(
          labelName,
          style: TextStyle(fontSize: normalSize, color: Colors.grey),
        ),
      ),
      SizedBox(
        height: 45,
        child: TextField(
          textInputAction: TextInputAction.go,
          controller: controller,
          decoration: InputDecoration(
              counter: Offstage(),
              counterText: '',
              contentPadding: const EdgeInsets.only(
                bottom: 12.0,
              ),
              focusColor: primaryColor,
              errorText: isShowValidation ? errorMsg : null),
          maxLength: maxLength,
          maxLengthEnforced: true,
          keyboardType: inputType,
          inputFormatters: inputRestriction != null
              ? [
                  inputRestriction,
                  LengthLimitingTextInputFormatter(maxLength),
                ]
              : null,
          onChanged: (value) {
            return valueSubmitted(value);
          },
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          onTap: () {
            onClicked();
          },
        ),
      )
    ],
  );
}

Widget commonEditTextForMobile(
    {@required BuildContext context,
    @required String labelName,
    @required TextInputType inputType,
    @required int maxLength,
    @required TextEditingController controller,
    @required bool isShowValidation,
    @required String errorMsg,
    FilteringTextInputFormatter inputRestriction,
    @required Function(String) valueSubmitted,
    @required Function onClicked}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.topLeft,
      ),
      SizedBox(
        // height: 65,
        child: Stack(
          children: [
            Text(
              labelName,
              style: TextStyle(fontSize: normalSize, color: Colors.grey),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Align(
                child: Text(
                  '+91 ',
                  style: TextStyle(fontSize: normalSize),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            TextField(
              textInputAction: TextInputAction.go,
              controller: controller,
              decoration: InputDecoration(
                  counter: Offstage(),
                  counterText: '',
                  contentPadding: const EdgeInsets.only(left: 35, top: 20),
                  focusColor: primaryColor,
                  errorText: isShowValidation ? errorMsg : null),
              maxLength: maxLength,
              maxLengthEnforced: true,
              keyboardType: inputType,
              inputFormatters: inputRestriction != null
                  ? [
                      inputRestriction,
                      LengthLimitingTextInputFormatter(maxLength),
                    ]
                  : null,
              onChanged: (value) {
                return valueSubmitted(value);
              },
              onEditingComplete: () {
                FocusScope.of(context).unfocus();
              },
              onTap: () {
                onClicked();
              },
            ),
          ],
        ),
      )
    ],
  );
}

String validate(String value) {
  if (value.length == 0) {
    return "Please Enter Mobile Number";
  }
}

Widget commonRoungButtonGreen(
    @required String labelName, @required Function() onsubmit, double width) {
  return Container(
    height: 40,
    width: width,
    child: RaisedButton(
        onPressed: () {
          onsubmit();
        },
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: primaryColor,
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Text(
            labelName,
            style: TextStyle(
              color: Colors.white,
              fontSize: normalSize,
            ),
          ),
        )),
  );
}

Widget commonToolbar(@required BuildContext context, @required String pageTitle,
    @required bool isGreen) {
  return Stack(
    children: [
      Transform.scale(
        scale: 0.8,
        child: FlatButton(
          shape: CircleBorder(),
          color: isGreen ? primaryColor : Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: isGreen ? Colors.white : primaryColor,
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          pageTitle,
          style: isGreen
              ? TextStyle(
                  color: Colors.black,
                  fontSize: normalSize,
                  fontWeight: FontWeight.bold)
              : TextStyle(
                  color: Colors.white,
                  fontSize: normalSize,
                  fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}

Widget getCommonSpinnerWithHeading({
  @required String labelName,
  @required List<DropdownMenuItem<int>> list,
  @required Function(int) validator,
  @required Function(String) onSaved,
  @required Function(int) onChanged,
  @required Function(String) onSubmitted,
  @required String dropDownHint,
  @required bool isShowIcon,
  Color backgroundColor,
}) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelName,
          style: TextStyle(fontSize: normalSize, color: Colors.grey),
        ),
        Stack(
          children: [
            isShowIcon
                ? Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: primaryColor,
                    ),
                  )
                : SizedBox(),
            DropdownButtonFormField(
              hint: Text(dropDownHint),
              items: list,
              onChanged: (value) {
                onChanged(value);
              },
              isExpanded: true,
              validator: (value) {
                return validator(value);
              },
              onSaved: (value) => onSaved(value),
              decoration: InputDecoration(
                contentPadding: isShowIcon
                    ? EdgeInsets.only(left: 25.0, right: 10.0)
                    : EdgeInsets.only(right: 10.0),
                focusColor: primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
      ]);
}

showAlertDialog(
    {@required BuildContext context,
    @required String title,
    @required String alertMsg,
    @required Function() continuePressed,
    @required Function() cancelledPressed}) {
  Widget cancelButton = FlatButton(
    child: Text(
      buildTranslate(context, 'cancel'),
      style: TextStyle(color: primaryColor),
    ),
    onPressed: () {
      cancelledPressed();
      Navigator.of(context).pop(); // dismiss dialog
    },
  );
  Widget continueButton = FlatButton(
    child: Text(buildTranslate(context, 'continue'),
        style: TextStyle(color: primaryColor)),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
      continuePressed();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(alertMsg),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget commonProgressIndicator() {
  return Center(
      child: Card(
    elevation: 10,
    color: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Container(
      padding: EdgeInsets.all(20),
      child: CircularProgressIndicator(),
    ),
  ));
}

Future<bool> getNetworkAvailability() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('Network_availability: connected');
      return true;
    }
  } on SocketException catch (_) {
    print('Network_availability: not connected');
    return false;
  }
}
