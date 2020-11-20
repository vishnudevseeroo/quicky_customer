import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  ContactUsState createState() => ContactUsState();
}

class ContactUsState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: contentBody(),
      bottomNavigationBar: getBottomButton(),
    );
  }

  Widget contentBody() {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            getHeaderLayout(),
            Text(
              'Quicky',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: heading3,
                  fontWeight: FontWeight.bold),
            ),
            socialMediaLayout(),
            locationLayout(),
          ],
        ),
      ),
    );
  }

  Widget getHeaderLayout() {
    return Container(
      padding: EdgeInsets.only(bottom: 30, top: 30),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          image: new DecorationImage(
              image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10.0)],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      width: double.infinity,
      child: Column(
        children: [
          commonToolbar(context, 'contact_us', false),
          SizedBox(
            height: 15,
          ),
          Image.asset(
            'assets/images/logo.png',
            width: 140,
            height: 140,
          )
        ],
      ),
    );
  }

  Widget socialMediaLayout() {
    return Container(
      width: double.infinity,
      height: 230,
      margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.5,
              shrinkWrap: true,
              children: [
                generateGridChild('assets/images/mobile.png', '+91 9605834569'),
                generateGridChild(
                    'assets/images/whatsapp.png', '+91 9605834569'),
                generateGridChild('assets/images/facebook.png', 'Facebook'),
                generateGridChild('assets/images/instagram.png', 'Instagram'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Center(
              child: Divider(
                thickness: 1,
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 40),
            child: Center(
              child: VerticalDivider(
                thickness: 1,
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget generateGridChild(String imagePath, String title) {
    return SizedBox(
      child: Column(
        children: [
          Image.asset(imagePath),
          SizedBox(
            height: 10,
          ),
          Text(title)
        ],
      ),
    );
  }

  Widget locationLayout() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our Location',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: heading5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Ouicky',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: normalSize),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 28),
                child: Text(
                  'Ayilakkad Road, Naduvattam, Edappal,\nPincode - 679571',
                  style: TextStyle(color: Colors.black, fontSize: normalSize),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBottomButton() {
    return GestureDetector(
      onTap: () {
        print('submit clicked');
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.mail,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'E-Mail',
              style: TextStyle(color: Colors.white, fontSize: normalSize),
            ),
          ],
        ),
      ),
    );
  }
}
