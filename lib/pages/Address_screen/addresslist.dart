import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quicky_customer/pages/Payment_methods/cardpayment.dart';
import 'package:quicky_customer/pages/localization/language_constants.dart';
import 'package:quicky_customer/pages/payment_method/payment_method.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
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
          "My Address",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: deliveryAddress(),
      bottomNavigationBar: bottomButton(),
    );
  }

  Widget deliveryAddress() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Example1Horizontal(),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              Container(
                height: 1,
                width: 120,
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
              ),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              Container(
                height: 1,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        // timeLine(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Bag", style: TextStyle(fontSize: 18)),
            Text("Address", style: TextStyle(fontSize: 18)),
            Text("Payment", style: TextStyle(fontSize: 18)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
          child: Container(
            height: 70,
            width: 500,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Delivered to Current Location",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "Or",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 30,
        ),
        addressList(),
      ],
    );
  }

  Widget addressList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: [
              Container(
                height: 130,
                child: Card(
                    // elevation: 1,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: primaryColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Address 1",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Ayilakkad Road, Naduvattom, Edappal,"),
                                Text("Pincode - 679571"),
                              ]),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: FlatButton(
                            minWidth: 60,
                            color: primaryColor,
                            child: Text(
                              'EDIT',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          );
        });
  }

  Widget bottomButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PaymentMethod()));
        print('button clicked');
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 23, 20, 23),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Proceed to Payment',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class Example1Horizontal extends StatelessWidget {
  const Example1Horizontal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Center(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 100),
              color: Colors.white,
              child: Row(
//mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
// crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.center,
                    isFirst: true,
                    indicatorStyle: const IndicatorStyle(
                      height: 20,
                      color: Colors.green,
                      indicatorXY: 0.2,
                      padding: EdgeInsets.all(0),
                    ),
                    endChild: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("example"),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 120,
                      ),
                      color: Colors.white,
                    ),
                    afterLineStyle: const LineStyle(
                      color: Colors.green,
                      thickness: 6,
                    ),
                  ),
                  TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.center,
                    isFirst: false,
                    indicatorStyle: const IndicatorStyle(
                      height: 20,
                      color: Colors.green,
                      indicatorXY: 0.2,
                      padding: EdgeInsets.all(0),
                    ),
                    endChild: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("example"),
                      ),
                      constraints: const BoxConstraints(minWidth: 120),
                      color: Colors.white,
                    ),
                    beforeLineStyle: const LineStyle(
                      color: Colors.green,
                      thickness: 6,
                    ),
                  ),
                  TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.center,
                    isLast: true,
                    indicatorStyle: const IndicatorStyle(
                      height: 20,
                      color: Colors.green,
                      indicatorXY: 0.2,
                    ),
                    endChild: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("example"),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 100,
                      ),
                      color: Colors.white,
                    ),
                    beforeLineStyle: const LineStyle(
                      color: Colors.green,
                      thickness: 6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
