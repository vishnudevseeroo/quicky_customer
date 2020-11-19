import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/product_details/product_detail_bottom_bar.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderStatus extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  OrderStatusState createState() => OrderStatusState();
}

class OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
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
          buildTranslate(context, 'order_details'),
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
                orderId(),
                timeLine(),
                orderDetailsHeading('order_details'),
                orderDetails(),
                SizedBox(
                  height: 10,
                ),
                details(),
                orderDetailsHeading('address'),
                address()
              ],
            )),
        ProductDetailBottomBar(
            // product: productDetails.product,
            // chosenUom: selectedUom,
            // overlayLoadCallBack: overlayLoadCallBack,
            )
      ],
    );
  }

  orderDetailsHeading(String title) {
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

  address() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 8),
      child: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Text(
          "A simple yet fully customizable ratingbar for flutter which also include a rating bar indicator, supporting any fraction of rating.",
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: normalSize),
        ),
      ),
    );
  }

  orderDetails() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            color: Colors.white,
            child: Center(
              // child: Image.network(
              //   cartDetails.products[index].image_url,
              //   width: 75,
              //   height: 75,
              // ),
              child: Image.asset(
                'assets/images/splash.png',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Text(
                "Value",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '₹ 287',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'QTY - 1',
                style: TextStyle(color: Colors.green, fontSize: 17),
              ),
            ],
          ),
        ],
      ),
    );
  }

  details() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Name :'),
                  Text(
                    'Vishnu dev t',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Email :'),
                  Text(
                    'vishnudevt@gmail.com',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Phone Number :'),
                  Text(
                    '9809009890',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget timeLine() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          // final example = examples[index];

          return TimelineTile(
            axis: TimelineAxis.vertical,
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isFirst: index == 0,
            isLast: index == 3,
            indicatorStyle: IndicatorStyle(
              width: 40,
              height: 40,
              indicator: _IndicatorExample(number: '${0 + 1}'),
              drawGap: true,
            ),
            beforeLineStyle: LineStyle(
              color: primaryColor,
            ),
            endChild: GestureDetector(
              child: _RowExample(example: "gggg"),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute<ShowcaseTimeline>(
                //     builder: (_) =>
                //         ShowcaseTimeline(example: example),
                //   ),
                // );
              },
            ),
          );
        },
      ),
    );
  }

  Padding orderId() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Container(
        padding: EdgeInsets.only(left: 18, right: 18, top: 14, bottom: 14),
        decoration: BoxDecoration(
            color: primaryColor,
            // border: Border.all(
            //   color: Colors.grey[300],
            // ),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          "Order Id : 4553356667755",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _RowExample extends StatelessWidget {
  const _RowExample({Key key, this.example}) : super(key: key);

  final String example;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Example",
          ),
          SizedBox(
            height: 8,
          ),
          const Icon(
            Icons.watch_later,
            color: Colors.grey,
            size: 26,
          ),
        ],
      ),
    );
  }
}

class _IndicatorExample extends StatelessWidget {
  const _IndicatorExample({Key key, this.number}) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor,

        //),
      ),
      child: Center(
        child: Icon(
          Icons.offline_pin,
          color: Colors.white,
        ),
      ),
    );
  }
}
