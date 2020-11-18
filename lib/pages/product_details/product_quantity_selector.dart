import 'package:flutter/material.dart';

class ProductQuantitySelector extends StatefulWidget {
  // final ProductInfo product;
  // final MultiUomDetails chosenUom;

  // const ProductQuantitySelector({Key key, this.product, this.chosenUom})
  //     : super(key: key);
  @override
  _ProductQuantitySelectorState createState() =>
      _ProductQuantitySelectorState();
}

class _ProductQuantitySelectorState extends State<ProductQuantitySelector> {
  int _n = 1;

  @override
  Widget build(BuildContext context) {
    print('qty selector building');
    return Container(
        height: 60,
        // color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'QTY',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(
                Icons.remove,
                color: Colors.black,
                size: 30,
              ),
              onPressed: minus,
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text('99'),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black,
                size: 30,
              ),
              onPressed: add,
            ),
          ],
        ));
  }

  void add() {
    // var limit = widget.product.limit_number;
    // if (widget.chosenUom != null) {
    //   limit = widget.chosenUom.limitNumber;
    // }
    // if (_n < limit) {
    //   _n++;
    //   Provider.of<QuantityProvider>(context, listen: false).changeQtyTo(_n);
    // }
  }

  void minus() {
    // if (_n != 1) {
    //   _n--;
    //   Provider.of<QuantityProvider>(context, listen: false).changeQtyTo(_n);
    // }
  }
}
