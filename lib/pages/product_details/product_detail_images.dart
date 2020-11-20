import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailImages extends StatefulWidget {
  // final List<String> images;
  // final ProductInfo product;
  // ProductDetailImages({Key key, @required this.images, @required this.product})
  //     : super(key: key);

  @override
  _ProductDetailImagesState createState() => _ProductDetailImagesState();
}

class _ProductDetailImagesState extends State<ProductDetailImages> {
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    String link = 'https://shopprix.com/';
    // if (widget.product.product_url.isEmpty) {
    //   link = 'https://shopprix.com/';
    // } else {
    //   link = widget.product.product_url;
    // }
    return Column(
      children: <Widget>[
        Stack(children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 1.3,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentSlide = index;
                  });
                }),
            items: imgList
                .map((image) => Container(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Image.network(image,
                              fit: BoxFit.contain, width: 1000.0),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ]),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: widget.images.map((image) {
        //     int index = widget.images.indexOf(image);
        //     return Container(
        //         width: 36.0,
        //         height: 36.0,
        //         margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2),
        //         decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //             border: Border.all(
        //                 color: _currentSlide == index
        //                     ? Theme.of(context).primaryColor
        //                     : Colors.grey[200],
        //                 width: 2)),
        //         child: CircleAvatar(
        //           backgroundImage: NetworkImage(image),
        //         ));
        //   }).toList(),
        // ),
      ],
    );
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
