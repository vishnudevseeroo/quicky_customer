import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showSnackBar(GlobalKey<ScaffoldState> key, String message) {
  key.currentState.removeCurrentSnackBar();
  key.currentState.showSnackBar(SnackBar(
    backgroundColor: Color.fromRGBO(29, 81, 128, 1),
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
  ));
}

SnackBar showNewSnackBar(BuildContext context, String message) {
  Scaffold.of(context).removeCurrentSnackBar();
  return SnackBar(
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Color.fromRGBO(29, 81, 128, 1),
  );
}

void showShortToast(String message) {
  Fluttertoast.showToast(
      msg: message, gravity: ToastGravity.CENTER, backgroundColor: Colors.red);
}
