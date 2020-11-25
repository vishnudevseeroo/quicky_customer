import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';

import 'package:quicky_customer/pages/payment_method/payment_method.dart';
import 'package:quicky_customer/pages/payment_method/payment_method_timeline.dart';
import 'package:quicky_customer/pages/product_details/product_detail_bottom_bar.dart';
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
        title: Text(buildTranslate(context,
          "my address"),
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: buildCartPageView(),
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
                deliveryAddress(),
                addressList(),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
        ProductDetailBottomBar(
          tittle: "add_to_cart",
          isIcon: false,
          // product: productDetails.product,
          // chosenUom: selectedUom,
          // overlayLoadCallBack: overlayLoadCallBack,
        )
      ],
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

  Widget addressList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                child: Card(
                    // elevation: 1,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            color: primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Address 1hjgsdjzhvjhdsghjvb jjhcsvhjsdhjbvjhbsdhjbvhjbsdvjhsdvbj hjvadhgvfjd v ghsdvfghdvsvdsg vsdh",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal)),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: FlatButton(
                                    onPressed: () {},
                                    minWidth: 60,
                                    color: primaryColor,
                                    child: Text( buildTranslate(context,
                                      'edit'),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ]),
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

  Widget deliveryAddress() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Expanded(
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
                  Text(buildTranslate(context,"delivered to current location"),
                      style: TextStyle(color: Colors.white, fontSize: 18),maxLines: 3,),
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
        ),
        SizedBox(
          height: 30,
        ),
        Text( buildTranslate(context,"or"),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
