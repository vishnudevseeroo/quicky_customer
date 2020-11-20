import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quicky_customer/pages/contact_us/contact_us.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/login/login.dart';
import 'package:quicky_customer/pages/my_address/my_address.dart';
import 'package:quicky_customer/pages/my_orders/my_orders.dart';
import 'package:quicky_customer/pages/payment_method/payment_method.dart';
import 'package:quicky_customer/pages/profile/edit_profile.dart';
import 'package:quicky_customer/pages/profile/profile.dart';
import 'package:quicky_customer/pages/select_language/select_language.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';

class NavigationDrawer extends StatelessWidget {
  BuildContext _context;

  static final List<String> drawerList = [
    'profile',
    'my_orders',
    'my_address',
    'refer_friend',
    'rate_app',
    'change_language',
    'about_Us',
    'contact_us',
    'logout'
  ];

  static final List<String> drawerIconList = [
    'assets/images/account.png',
    'assets/images/account.png',
    'assets/images/add_product.png',
    'assets/images/add_product.png',
    'assets/images/notification.png',
    'assets/images/lan.png',
    'assets/images/about_us.png',
    'assets/images/contact_us.png',
    'assets/images/logout.png'
  ];

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0)),
          child: Drawer(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  image: new DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.fill,
              )),
              child: getDrawerList(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 20,
        ),
        IconButton(
          alignment: Alignment.topRight,
          icon: Icon(Icons.close),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        getDrawerHeader(),
        SizedBox(
          height: 25,
        ),
        Expanded(child: drawerItemList()),
      ],
    );
  }

  Widget getDrawerHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(_context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
          child: CircleAvatar(
            radius: 45.0,
            backgroundImage: AssetImage('assets/images/logo1.png'),
            backgroundColor: Colors.transparent,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Organic',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: heading1a),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '+91 9605834569',
                style: TextStyle(color: Colors.white, fontSize: normalSize),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget drawerItemList() {
    return ListView.builder(
      itemBuilder: (context, position) {
        return drawerItemGenerator(position, context);
      },
      itemCount: drawerList.length,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget drawerItemGenerator(int index, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        print('cliked on item position:$index');
        openNewScreen(index, _context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 30, right: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  drawerIconList.elementAt(index),
                  color: Colors.white,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  buildTranslate(context, drawerList.elementAt(index)),
                  // "vvvvv",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: drawer),
                )
              ],
            ),
            index == drawerList.length - 1
                ? SizedBox()
                : Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.white,
                  ),
          ],
        ),
      ),
    );
  }

  void openNewScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditProfile()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyOrderScreen()));

        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyAddress()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
        break;
      case 4:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PaymentMethod(
                    //isFromSplashScreen: false,
                    )));
        break;
      case 5:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SelectLanguageScreen(
                      isFromSplashScreen: false,
                    )));

        break;
      case 6:
        Navigator.pop(context);

        break;
      case 7:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ContactUsScreen()));
        break;
      case 8:
        showAlertDialog(
            context: _context,
            title: buildTranslate(context, 'logout'),
            alertMsg: buildTranslate(context, 'logout_msg'),
            continuePressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            cancelledPressed: () {});
        break;
    }
  }
}
