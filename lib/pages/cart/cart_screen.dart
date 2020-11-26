import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quicky_customer/pages/Address_screen/addresslist.dart';
import 'package:quicky_customer/pages/cart/cart_other_details.dart';
import 'package:quicky_customer/pages/cart/quantity_selector.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/my_address/my_address.dart';
import 'package:quicky_customer/pages/product_details/product_details.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/cart-page';
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isLoading = false;
  bool isOverlayLoad = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var couponFieldController = TextEditingController();
  bool couponApplied = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Cart building");
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(241, 244, 253, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
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
        title: Text( buildTranslate(context,
          'cart'),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(child: buildCartPageView()),
    );
  }

  Widget buildLoginUI() {
    return Center(
      child: RichText(
        text: TextSpan(
            text: 'Please ',
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: 'login',
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()),
              TextSpan(text: ' to continue')
            ]),
      ),
    );
  }

  Widget showCartEmptyWidget() {
    return Center(
      child: Image.asset('assets/images/no_items.png'),
    );
  }

  Widget buildCartPageView() {
    return ModalProgressHUD(
      inAsyncCall: isOverlayLoad,
      child: Column(
        children: <Widget>[
          Flexible(
              fit: FlexFit.loose,
              child: ListView(
                children: <Widget>[
                  buildCartListView(),
                  buildCouponField(),
                  CartOtherDetails(
                      // cartDetails: cartDetails,
                      ),
//                HeightSizedBox()
                ],
              )),
          buildBottomBar()
        ],
      ),
    );
  }

  Widget buildCouponField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            children: [
              Container(
                child: Icon(
                  Icons.location_on,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                    "seeroo it solution ugsudhavbj gysudcbdhs  hbsduvsdag"),
              ),
              FlatButton(
                child: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
                textColor: Theme.of(context).primaryColorDark,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (couponApplied) {
                    // _removeCouponFromCheckout();
                  } else {
                    // _addCouponToCheckout();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomBar() {
    return SafeArea(
      child: Container(
        width: double.maxFinite,
        height: 72,
        child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.shopping_basket,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(buildTranslate(context,
                          'buy more'),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddressPage()));
                    },
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ButtonTheme(
                      height: 40,
                      child: FlatButton(
                        color: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Text(buildTranslate(context,
                              'checkout'),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            )
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddressPage()));
                          print('cilcked');
                        },
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget buildCartListView() {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2,
        separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.grey[400],
            ),
        itemBuilder: (context, index) {
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
                      height: 75,
                      width: 75,
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
                    Text( buildTranslate(context,
                       "value"),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.bold,),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '₹ 287',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                      QuantitySelector(),

                    Text(
                      '₹ 287',
                      style: TextStyle(color: Colors.green, fontSize: 17),
                    ),
                  ],
                ),
                SizedBox(
                  width:40,
                ),
                Flexible(
                  child: IconButton(
                    alignment: Alignment.topRight,
                    icon: Icon(
                      Icons.cancel,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          );
        });
  }

  // void confirmToDeleteProduct(
  //     BuildContext context, CartProductDetail product, String qtyDescr) {
  //   showDialog(
  //       context: context,
  //       builder: (context2) {
  //         return AlertDialog(
  //           title: Text('Remove Product?'),
  //           content: Text('Are you sure to remove this product from cart?'),
  //           actions: <Widget>[
  //             FlatButton(
  //               child: Text('Cancel'),
  //               onPressed: () {
  //                 Navigator.of(context2).pop();
  //               },
  //             ),
  //             FlatButton(
  //               child: Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context2).pop();
  //                 setState(() {
  //                   isOverlayLoad = true;
  //                 });

  //                 Future<MyCartResponse> respFuture = quantitySelectionType == 1
  //                     ? removeProductFromCart(
  //                         cartID: cartDetails.cart_id,
  //                         productID: product.product_id,
  //                         qtyDescr: qtyDescr)
  //                     : removeProductFromCartForFloat(
  //                         cartID: cartDetails.cart_id,
  //                         productID: product.product_id,
  //                         lineId: product.line_id);

  //                 respFuture.then((response) {
  //                   if (response.status == true) {
  //                     setState(() {
  //                       cartDetails = response;
  //                     });
  //                   } else {
  //                     showSnackBar(_scaffoldKey,
  //                         response.message ?? 'Product not removed...');
  //                   }
  //                   setState(() {
  //                     isOverlayLoad = false;
  //                   });
  //                 });
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }
}
