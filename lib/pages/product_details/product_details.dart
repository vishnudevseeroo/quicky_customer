import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quicky_customer/pages/product_details/related_products_list.dart';
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
                        title: "this tweyyew twegd tewg",
                      ),
                      buildUomList(),
                      // RatingAndPrice(
                      //   product: product,
                      // ),
                      SizedBox(
                        height: 4,
                      ),
                      buildPriceWidget(),
                      ProductDescription(
                          //product: productDetails.product,
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

  Widget buildUomList() {
    return Container(
      height: 100,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: 4,
          separatorBuilder: (context, index) => SizedBox(
                width: 8,
              ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {});
              },
              child: Card(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Theme.of(context).primaryColor)),
                child: Container(
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '546',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '₹ 455',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                      //  Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       RichText(
                      //         textAlign: TextAlign.center,
                      //         text: TextSpan(children: [
                      //           TextSpan(
                      //             text:
                      //                 '₹ 546',
                      //             style: TextStyle(
                      //                 color: Colors.red,
                      //                 fontWeight: FontWeight.bold),
                      //           )
                      //         ]),
                      //       ),
                      //       SizedBox(
                      //         width: 4,
                      //       ),
                      //       RichText(
                      //         text: TextSpan(children: [
                      //           TextSpan(
                      //             text:
                      //                 '₹ 54646',
                      //             style: TextStyle(
                      //                 decoration:
                      //                     TextDecoration.lineThrough,
                      //                 color: Colors.grey,
                      //                 fontWeight: FontWeight.bold),
                      //           )
                      //         ]),
                      //       )
                      //     ],
                      //   ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
