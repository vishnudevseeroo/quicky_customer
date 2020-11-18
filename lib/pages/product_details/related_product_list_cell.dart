import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/product_details/product_detail_images.dart';

class RelatedProductListCell extends StatelessWidget {
  // final ProductInfo product;

  // const RelatedProductListCell({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => ProductDetailPage(
              //               productID: product.product_id,
              //               productName: product.en_lang,
              //             )));
            },
            child: Container(
              width: double.infinity,
//              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipOval(
                    child: FadeInImage(
                      height: 130,
                      placeholder: AssetImage('assets/images/splash.png'),
                      image: NetworkImage(imgList[0]),
                    ),
                  ),
                  Text(
                    "en langers",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

//           Positioned(
//             bottom: 30,
//             left: 0,
//             right: 0,
//             child: Container(
// //              color: Colors.green,
//               height: 84,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Container(
//                   color: Color.fromRGBO(251, 247, 242, 1),
//                   child: multiUomPresent
//                       ? Column(
//                     children: [
//                       buildUomDropDown(context),
//                       chosenUom.mrpPrice == 0
//                           ? Text(
//                         '₹ ${chosenUom.price.toStringAsFixed(2)}',
//                         style: TextStyle(
//                             color: Colors.red,
//                             fontWeight: FontWeight.bold),
//                         textAlign: TextAlign.center,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       )
//                           : Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.center,
//                             children: [
//                               RichText(
//                                 text: TextSpan(children: [
//                                   TextSpan(
//                                     text:
//                                     '₹ ${chosenUom.price.toStringAsFixed(2)}',
//                                     style: TextStyle(
//                                         color: Colors.red,
//                                         fontWeight:
//                                         FontWeight.bold),
//                                   )
//                                 ]),
//                               ),
//                               SizedBox(
//                                 width: 4,
//                               ),
//                               RichText(
//                                 text: TextSpan(children: [
//                                   TextSpan(
//                                     text:
//                                     '₹ ${chosenUom.mrpPrice.toStringAsFixed(2)}',
//                                     style: TextStyle(
//                                         decoration: TextDecoration
//                                             .lineThrough,
//                                         color: Colors.grey,
//                                         fontWeight:
//                                         FontWeight.bold),
//                                   )
//                                 ]),
//                               )
//                             ],
//                           ),
// //                                      Text('/ ${widget.item.unit}')
//                         ],
//                       ),
//                     ],
//                   )
//                       : widget.item.mrp_price == 0
//                       ? Text(
//                     '₹ ${widget.item.price.toStringAsFixed(2)}',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   )
//                       : Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           RichText(
//                             text: TextSpan(children: [
//                               TextSpan(
//                                 text:
//                                 '₹ ${widget.item.price.toStringAsFixed(2)}',
//                                 style: TextStyle(
//                                     color: Colors.red,
//                                     fontWeight: FontWeight.bold),
//                               )
//                             ]),
//                           ),
//                           SizedBox(
//                             width: 4,
//                           ),
//                           RichText(
//                             text: TextSpan(children: [
//                               TextSpan(
//                                 text:
//                                 '₹ ${widget.item.mrp_price.toStringAsFixed(2)}',
//                                 style: TextStyle(
//                                     decoration:
//                                     TextDecoration.lineThrough,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.bold),
//                               )
//                             ]),
//                           )
//                         ],
//                       ),
//                       Text('/ ${widget.item.unit}')
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
// //            left: 0,
// //            right: 0,
// //            bottom: 0,
//             child: ButtonTheme(
//               height: 48,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(10),
//                       bottomRight: Radius.circular(10))),
//               minWidth: double.infinity,
//               child: FlatButton(
//                 color: Theme.of(context).primaryColor,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.add_shopping_cart,
//                       color: Colors.black,
//                       size: 20,
//                     ),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                       'Add to Cart',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 onPressed: () {
//                   if (SharedPrefs.isloggedIn()) {
//                     showQtyDialog();
//                   } else {
//                     showGotoLoginDialog();
//                   }
//                 },
//               ),
//             ),
//           )
        ],
      ),
    );
  }
}
