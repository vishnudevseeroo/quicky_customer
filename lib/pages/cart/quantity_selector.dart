import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';

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
    print('quant selector rebuilding');
    return Row(
      children: <Widget>[
        Text(buildTranslate(context, 'Quantity'),style: TextStyle(fontSize: 12),
          overflow: TextOverflow.ellipsis,),
        IconButton(
          icon: Icon(
            Icons.remove,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: minus,
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
