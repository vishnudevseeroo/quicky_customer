import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quicky_customer/pages/product_details/product_quantity_selector.dart';
import 'package:quicky_customer/pages/product_details/related_products_list.dart';
import 'package:quicky_customer/pages/product_details/review_view.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';

import 'product_description.dart';
import 'product_detail_bottom_bar.dart';
import 'product_detail_images.dart';
import 'product_title.dart';

class ProductDetailPage extends StatefulWidget {
  static const String routeName = '/productDetailPage';
  // final int productID;
  // final String productName;
  // ProductDetailPage(
  //     {Key key, @required this.productID, @required this.productName})
  //     : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isOverlayLoading = false;
  bool isLoading = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  overlayLoadCallBack(bool loading) {
    setState(() {
      isOverlayLoading = loading;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
          "apple",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return ModalProgressHUD(
      inAsyncCall: isOverlayLoading,
      progressIndicator: CircularProgressIndicator(),
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ProductDetailImages(
                          // images: [productDetails.product.image_url],
                          // product: productDetails.product,
                          ),
                      ProductTitle(
                        title: "Burger Dio",
                      ),
                      amountView(),
                      SizedBox(
                        height: 4,
                      ),
                      ProductQuantitySelector(
                          // product: widget.product,
                          // chosenUom: widget.chosenUom,
                          ),
                      SizedBox(
                        height: 10,
                      ),
                      ProductDescription(
                          //product: productDetails.product,
                          ),
                      ReviewView(),
                      SizedBox(
                        height: 10,
                      ),
                      RelatedProductsList(
                          // products: productDetails.relatedProducts,
                          )
                    ],
                  ),
                ),
                ProductDetailBottomBar(
                    // product: productDetails.product,
                    // chosenUom: selectedUom,
                    // overlayLoadCallBack: overlayLoadCallBack,
                    )
              ],
            ),
    );
  }

  Widget buildPriceWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('Price: '),

          //  Text(
          //       '₹ 67',
          //       style: TextStyle(
          //           color: Colors.red,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 20),
          //       textAlign: TextAlign.center,
          //       maxLines: 1,
          //       overflow: TextOverflow.ellipsis,
          //     )
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                // textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: '₹ 56',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              ),
              SizedBox(
                width: 8,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '₹ 56',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget amountView() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        height: 100,
        // color: Colors.blueGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/burger.png',
                      height: 30,
                      width: 30,
                      // color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text("Rs 225.00"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                ratingView(),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              padding: const EdgeInsets.all(25),
              child: Text("Rs 225.00",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ],
        ),

        // child: ListView.separated(
        //     padding: const EdgeInsets.symmetric(horizontal: 8),
        //     itemCount: 4,
        //     separatorBuilder: (context, index) => SizedBox(
        //           width: 8,
        //         ),
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       return InkWell(
        //         onTap: () {
        //           setState(() {});
        //         },
        //         child: Card(
        //           color: Theme.of(context).primaryColor,
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(10),
        //               side: BorderSide(color: Theme.of(context).primaryColor)),
        //           child: Container(
        //             width: 150,
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 Text(
        //                   '546',
        //                   style: TextStyle(color: Colors.black),
        //                 ),
        //                 SizedBox(
        //                   height: 8,
        //                 ),
        //                 Text(
        //                   '₹ 455',
        //                   style: TextStyle(
        //                       color: Colors.red, fontWeight: FontWeight.bold),
        //                   textAlign: TextAlign.center,
        //                   maxLines: 1,
        //                   overflow: TextOverflow.ellipsis,
        //                 ),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     RichText(
        //                       textAlign: TextAlign.center,
        //                       text: TextSpan(children: [
        //                         TextSpan(
        //                           text: '₹ 546',
        //                           style: TextStyle(
        //                               color: Colors.red,
        //                               fontWeight: FontWeight.bold),
        //                         )
        //                       ]),
        //                     ),
        //                     SizedBox(
        //                       width: 4,
        //                     ),
        //                     RichText(
        //                       text: TextSpan(children: [
        //                         TextSpan(
        //                           text: '₹ 54646',
        //                           style: TextStyle(
        //                               decoration: TextDecoration.lineThrough,
        //                               color: Colors.grey,
        //                               fontWeight: FontWeight.bold),
        //                         )
        //                       ]),
        //                     )
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       );
        //     }),
      ),
    );
  }

  Container ratingView() {
    return Container(
        child: RatingBar.builder(
      initialRating: 2,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Colors.amber.withAlpha(50),
      itemCount: 5,
      itemSize: 30.0,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          // _rating = rating;
        });
      },
      updateOnDrag: false,
    ));
  }
}
