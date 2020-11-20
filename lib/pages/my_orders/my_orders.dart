import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/order_status/order_status.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';

class MyOrderScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  MyOrderScreenState createState() => MyOrderScreenState();
}

class MyOrderScreenState extends State<MyOrderScreen> {
  static const List<String> productIconList = [
    'assets/images/tomatto.png',
    'assets/images/capsicum.png',
    'assets/images/pottatto.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: contentlayout(),
      ),
    );
  }

  Widget contentlayout() {
    return Container(
      child: Column(
        children: [
          commonToolbar(context, 'my_orders', true),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 15, bottom: 40),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return generateListChild(index);
                }),
          )
        ],
      ),
    );
  }

  Widget generateListChild(int i) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 25, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '28 Oct, 2020 | 12.43 PM',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderStatus()));
              },
              child: Card(
                  child: Padding(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 13, bottom: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    orderDetails(),
                    SizedBox(
                      width: 85,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return index == 3
                              ? generateCardMoreItem()
                              : generateOrderTile(index);
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ],
        ));
  }

  Widget orderDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Burger Duo',
            style: TextStyle(
              color: Colors.black,
              fontSize: heading4,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '₹ 299.00',
            style: TextStyle(
                color: Colors.black,
                fontSize: normalSize,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(
              const Radius.circular(15.0),
            ),
            child: ButtonTheme(
              height: 40,
              child: FlatButton(
                  color: primaryColor,
                  child: Text(
                    'Delivered',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {}),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget generateCardMoreItem() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            '+4',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: normalSize),
          ),
        ),
      ),
    );
  }

  Widget generateOrderTile(int index) {
    print(productIconList.elementAt(index));
    return Card(
      color: dashBoardSmallCardColor,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Image.asset(productIconList.elementAt(index)),
      ),
    );
  }
}
