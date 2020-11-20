import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/payment_method/payment_method_timeline.dart';
import 'package:quicky_customer/pages/product_details/product_detail_bottom_bar.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';

class PaymentMethod extends StatefulWidget {
  static const routeName = '/paymentmethod';

  @override
  PaymentMethodState createState() => PaymentMethodState();
}

class PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Transform.scale(
          scale: 0.6,
          child: FlatButton(
            shape: CircleBorder(),
            color: primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          buildTranslate(context, 'payment_method'),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: buildCartPageView(),
      ),
    );
  }

  Widget buildCartPageView() {
    return Column(
      children: <Widget>[
        Flexible(
            fit: FlexFit.loose,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                horizontalTimeLine(),
                paymentTypeHeading('payment_method'),
                paymentTypeGrey('current_method'),
                paymentTypeListing(),
                SizedBox(
                  height: 10,
                ),
                details(),
              ],
            )),
        ProductDetailBottomBar(
          tittle: "add_to_cart",
          isIcon: true,
          // product: productDetails.product,
          // chosenUom: selectedUom,
          // overlayLoadCallBack: overlayLoadCallBack,
        )
      ],
    );
  }

  paymentTypeHeading(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 8, 8),
      child: Container(
        child: Text(
          buildTranslate(context, title),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  paymentTypeGrey(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 8, 8),
      child: Container(
        child: Text(
          buildTranslate(context, title),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }

  horizontalTimeLine() {
    return Container(
      height: 100,
      child: CustomScrollView(
        slivers: <Widget>[
          TimeLineHorizontal(),
        ],
      ),
    );
  }

  details() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              color: Colors.white,
              child: Center(
                child: Image.asset(
                  'assets/images/splash.png',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                Text(buildTranslate(context, "add_payment_mode"),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: normalSize,
                        color: Colors.grey)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                child: Icon(
                  Icons.check,
                  color: primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget paymentTypeListing() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          // final example = examples[index];

          return Padding(
            padding: const EdgeInsets.fromLTRB(25, 8, 16, 4),
            child: Card(
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.white,
                      child: Center(
                        // child: Image.network(
                        //   cartDetails.products[index].image_url,
                        //   width: 75,
                        //   height: 75,
                        // ),
                        child: Image.asset(
                          'assets/images/splash.png',
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        //mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "272386v 287828 2867824q9",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: normalSize),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Expired 07/22',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Container(
                        child: Icon(
                          Icons.check,
                          color: primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
