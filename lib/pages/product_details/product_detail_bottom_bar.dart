import 'package:flutter/material.dart';

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ButtonTheme(
                      height: 40,
                      child: FlatButton(
                          //color: Colors.grey,
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {}),
                    ),
                  ),
                  Container(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
