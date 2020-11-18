import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/dashboard_screen/dashboard_view.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';

class SuccessScreen extends StatefulWidget {
  static const routeName = '/successscreen';
  @override
  SuccessState createState() => SuccessState();
}

class SuccessState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: contentLayout(),
    );
  }

  Widget contentLayout() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/success.png'),
          SizedBox(
            height: 50,
          ),
          Text(
            buildTranslate(context, 'success'),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: heading1a),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            buildTranslate(context, 'you_are_ready_to_continue'),
            style: TextStyle(fontSize: normalSize),
          ),
          SizedBox(
            height: 30,
          ),
          commonRoungButtonGreen(buildTranslate(context, 'continue'), () {
            // onclick here
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DashboardPage()));
          }, 250)
        ],
      ),
    );
  }
}
