import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/cart/cart_price_details.dart';

class CartOtherDetails extends StatelessWidget {
  // final MyCartResponse cartDetails;
  // CartOtherDetails({Key key, @required this.cartDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          CartPriceDetails(
              // cartDetails: cartDetails,
              ),
        ],
      ),
    );
  }
}
