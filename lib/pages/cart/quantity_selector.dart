import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  // Function(CartProductDetail, QuantityTypeChanged) callback;

  // QuantitySelector({Key key, @required this.product, @required this.callback})
  //     : super(key: key);

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('quant slector rebuilding');
    return Row(
      children: <Widget>[
        Text('Quantity: '),
        IconButton(
          icon: Icon(
            Icons.remove,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: minus,
        ),
        Container(
          width: 20,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text('valuuuu'),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: add,
        ),
      ],
    );
  }

  void add() {
    // print('limit- ${widget.product.limit_number}');
    // if (widget.product.product_uom_qty < widget.product.limit_number) {
    //   print('on plus ${widget.product.product_uom_qty}');
    //   widget.callback(widget.product, QuantityTypeChanged.plus);
    // }
  }

  void minus() {
    // if (widget.product.product_uom_qty > 1) {
    //   print('on minus ${widget.product.product_uom_qty}');
    //   widget.callback(widget.product, QuantityTypeChanged.minus);
    // }
  }
}

enum QuantityTypeChanged { plus, minus }
