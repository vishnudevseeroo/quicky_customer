

import 'package:flutter/material.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
      ),
      body: getNotificationLayout() ,
    );
  }

  Widget getNotificationLayout() {
    return Container(
      child: Column(
        children: [
          // toolBarForNotification(
          //     context, getTranslated(context, 'notification'), true),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return notificationChildItem();
              },
              itemCount: 15,
            ),
          ),
        ],
      ),
    );
  }
  Widget toolBarForNotification(@required BuildContext context,
      @required String pageTitle, @required bool isGreen) {
    return Stack(
      children: [
        FlatButton(
          shape: CircleBorder(),
          color: isGreen ? primaryColor : Colors.white,
          onPressed: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: isGreen ? Colors.white : primaryColor,
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

  Widget notificationChildItem() {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('assets/images/logo1.png'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet, cu quo tantas forensibus. Ei denique mandamus his. Usu ad sensibus antiopam, id nullam sensibus sit. Te apeirian pertinax his, nam id debet interesset.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '9 hrs',
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
    );
  }




}

