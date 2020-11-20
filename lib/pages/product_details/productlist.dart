import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/Address_screen/addresslist.dart';
import 'package:quicky_customer/pages/localization/language_constants.dart';
import 'package:quicky_customer/pages/product_details/product_details.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';

class ProductScreen extends StatefulWidget {
  @override
  ProductScreenState createState() => ProductScreenState();
}

class ProductScreenState extends State<ProductScreen> {
  List<String> productNameList = [
    'Burger',
    'Burger',
    'Burger',
    'Burger',
    'Burger'
  ];

  List<String> productImageList = [
    'assets/images/chicking.png',
    'assets/images/burger.png',
    'assets/images/burger.png',
    'assets/images/burger.png',
    'assets/images/burger.png'
  ];

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
          "Chicking",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: productGrid(),
      ),
    );
  }

  Widget productGrid() {
    return Container(
      child: Column(
        children: [
          // commonToolbar(context,"Restuarants", true),
          Expanded(
            child: GridView.builder(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 50),
              itemCount: productNameList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return generateProductChildItem(index);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget generateProductChildItem(int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Column(children: [
        Expanded(
          child: Stack(children: [
            GestureDetector(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                child: Image.asset(
                  productImageList.elementAt(index),
                  fit: BoxFit.fill,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailPage()));
              },
            ),
            Positioned(
              top: 5,
              right: 5,
              child: SizedBox(
                width: 40,
                height: 20,
                child: FlatButton(
                  shape: CircleBorder(),
                  onPressed: () {
                    showAlertDialog(
                        context: context,
                        title: getTranslated(context, 'delete_product'),
                        alertMsg: getTranslated(context, 'delete_product_msg'),
                        continuePressed: () {
                          setState(() {
                            productNameList.removeAt(index);
                            productImageList.removeAt(index);
                          });
                        },
                        cancelledPressed: () {});
                  },
                  child: Icon(
                    Icons.cancel,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  productNameList.elementAt(index),
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '₹ 250.00',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: heading5),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
