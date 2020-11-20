import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/product_details/product_detail_bottom_bar.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';

class MyAddress extends StatefulWidget {
  static const routeName = '/paymentmethod';

  @override
  MyAddressState createState() => MyAddressState();
}

class MyAddressState extends State<MyAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
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
          buildTranslate(context, 'my_address'),
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
                addressHeading('saved_addresses'),
                addressListing(),
              ],
            )),
        ProductDetailBottomBar(
          tittle: "add_new_address",
          isIcon: false,
          // product: productDetails.product,
          // chosenUom: selectedUom,
          // overlayLoadCallBack: overlayLoadCallBack,
        )
      ],
    );
  }

  addressHeading(String title) {
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

  Widget addressListing() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          // final example = examples[index];

          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
            child: Card(
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      height: 80,
                      color: Colors.white,
                      child: Center(
                        child: Icon(
                          Icons.location_history,
                          color: primaryColor,
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
                            "272386v 287828 2867824q9 shgdf utsgfdgsjd svdgghvbsdhbv geyfuead hgsgfugs  gysgfugusd geygfuhead gyegfuuhsdi hsdhg",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: normalSize),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Container(
                                  child: Text(
                                    "EDIT",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: normalSize,
                                        color: primaryColor),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Container(
                                  child: Text(
                                    "DELETE",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: normalSize,
                                        color: primaryColor),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
