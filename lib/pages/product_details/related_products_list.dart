import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/product_details/related_product_list_cell.dart';

class RelatedProductsList extends StatelessWidget {
  // final List<ProductInfo> products;

  // const RelatedProductsList({Key key, this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text( buildTranslate(context,
            'related products'),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          height: 230,
          // margin: EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
              padding: EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return RelatedProductListCell(
                    // product: products[index],
                    );
              }),
        ),
      ],
    );
  }
}
