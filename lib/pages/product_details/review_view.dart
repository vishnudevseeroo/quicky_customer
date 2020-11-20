import 'package:flutter/material.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        height: 60,
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Reviews',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_drop_down_sharp,
                color: Colors.blue,
                size: 30,
              ),
              onPressed: () {},
            ),
          ],
        ));
  }
}
