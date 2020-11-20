import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final String title;
  ProductTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Text(title,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.bold)),
    );
  }
}
