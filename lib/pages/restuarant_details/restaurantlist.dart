
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/localization/language_constants.dart';
import 'package:quicky_customer/pages/product_details/productlist.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';
import 'package:quicky_customer/utils/constants.dart';

class RestaurantScreen extends StatefulWidget {
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {

  List<String> productNameList = [
    'KFC',
    'KFC',
    'KFC',
    'KFC',
    'KFC'
  ];

  List<String> productImageList = [
    'assets/images/chicking.png',
    'assets/images/chicking.png',
    'assets/images/chicking.png',
    'assets/images/chicking.png',
    'assets/images/chicking.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
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
          "Restaurants",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: contentLayout(),
      ),
    );
  }

  Widget contentLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
      ),
    );
  }

  Widget generateProductChildItem(int index) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                     topRight: Radius.circular(10.0)
                  ),
                  child: Image.asset(productImageList.elementAt(index)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductScreen()));
                },
              ),
            ),
            SizedBox(
              height:10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      productNameList.elementAt(index),
                      style: TextStyle(
                          color: Colors.black, fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
