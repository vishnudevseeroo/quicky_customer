import 'package:flutter/material.dart';

class CartPriceDetails extends StatelessWidget {
  // final MyCartResponse cartDetails;
  // CartPriceDetails({Key key, @required this.cartDetails}) : super(key: key);
  final priceTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: priceWidgets(context));
  }

  List<Widget> priceWidgets(BuildContext context) {
    var widgets = List<Widget>();
//    final itemTotal = cartDetails.amount_untaxed - cartDetails.coupon_amount;
    widgets.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Item Total 4 Item/s):'),
          Text(
            '₹ 34',
            style: priceTextStyle,
          ),
        ],
      ),
    ));
//    widgets.add(Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Text('Tax:'),
//          Text(
//            '₹ ${cartDetails.amount_tax.toStringAsFixed(2)}',
//            style: priceTextStyle,
//          ),
//        ],
//      ),
//    ));
    // if (cartDetails.coupon_amount != 0) {
    widgets.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Coupon Discount:'),
          Text(
            '₹ 67',
            style: priceTextStyle,
          ),
        ],
      ),
    ));
    //}
    widgets.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Delivery Charge:'),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '₹ 56',
                  style: priceTextStyle,
                ),
                SizedBox(
                  height: 8,
                ),
                buildDeliveryDetail()
              ],
            ),
          )
        ],
      ),
    ));
    widgets.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'GRAND TOTAL',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.all(12),
            child: Text(
              '₹ 676',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ));

    return widgets;
  }

  Widget buildDeliveryDetail() {
    // if (cartDetails.apply_delivery_charge) {
    return Text(
      '* 909',
      style: TextStyle(fontSize: 11),
    );
    // }
    // return Container();
  }
}
