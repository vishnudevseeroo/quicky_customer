import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/product_details/product_quantity_selector.dart';

class ProductDetailBottomBar extends StatefulWidget {
  // final ProductInfo product;
  // final MultiUomDetails chosenUom;
  // final Function(bool) overlayLoadCallBack;
  // const ProductDetailBottomBar(
  //     {Key key, this.product, this.chosenUom, this.overlayLoadCallBack})
  //     : super(key: key);

  @override
  _ProductDetailBottomBarState createState() => _ProductDetailBottomBarState();
}

class _ProductDetailBottomBarState extends State<ProductDetailBottomBar> {
  @override
  Widget build(BuildContext context) {
    print('bottom bar building');
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
                  ProductQuantitySelector(
                      // product: widget.product,
                      // chosenUom: widget.chosenUom,
                      ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ButtonTheme(
                      height: 40,
                      child: FlatButton(
                          color: Colors.grey,
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {}),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

//   void callAddToCartApi() {
//     widget.overlayLoadCallBack(true);
//     print(
//         'qty selected; ${context.read<QuantityProvider>().quantity.toString()} ');
//     Future<AddToCartResponse> responseFuture = addProductToCartForFloat(
//         productId: widget.product.product_id,
//         qty: context.read<QuantityProvider>().quantity.toString(),
//         uomLineId: widget.chosenUom == null
//             ? ''
//             : widget.chosenUom.uomLineId.toString());
//     responseFuture.then((response) {
//       widget.overlayLoadCallBack(false);
//       if (response.status == true) {
//         changeCartCountTo(response.count);
//         showDialog(
//             context: context,
//             builder: (context2) {
//               return AlertDialog(
//                 title: Image.asset(
//                   'assets/images/cart_alert.png',
//                   height: 100,
//                   width: 100,
//                 ),
//                 content: Text(
//                   'Product added successfully to cart',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 actions: [
//                   RaisedButton(
//                     color: Colors.blue,
//                     textColor: Colors.white,
//                     child: Text('Continue Shopping'),
//                     onPressed: () {
//                       Navigator.of(context2).pop();
//                       Navigator.pop(context);
//                     },
//                   ),
//                   RaisedButton(
//                     color: Colors.red,
//                     textColor: Colors.white,
//                     child: Text('Go to Cart'),
//                     onPressed: () {
//                       Navigator.of(context2).pop();
//                       Navigator.of(context).pushNamed(CartPage.routeName);
//                     },
//                   )
//                 ],
//               );
//             });
// //        Scaffold.of(context).showSnackBar(
// //            showNewSnackBar(context, 'Product added successfully to cart'));
//       } else {
//         Scaffold.of(context).showSnackBar(showNewSnackBar(
//             context, response.message ?? 'Sorry, product not added to cart'));
//       }
//     });
//   }

  // changeCartCountTo(int newValue) {
  //   print('Changing count to $newValue in homepage -----');
  //   context.read<CartCounter>().changeCountTo(newValue);
  // }

  // showGotoLoginDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Login needed'),
  //           content: Text('Please login to continue'),
  //           actions: <Widget>[
  //             FlatButton(
  //               child: Text('Cancel'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //             FlatButton(
  //               child: Text('Continue'),
  //               onPressed: () {
  //                 Navigator.pushNamedAndRemoveUntil(
  //                     context, WelcomePage.routeName, (route) => false);
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }
}
