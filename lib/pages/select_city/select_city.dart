import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';

class SelectCity extends StatefulWidget {
  static const routeName = '/selectcity';

  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  TextEditingController _searchFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: contentLayout()),
    );
  }

  Widget contentLayout() {
    return Column(
      children: [
        commonToolbar(context, 'Select City', true),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              searchField(),
            ],
          ),
        ),
      ],
    );
  }

  searchField() {
    return Container(
        height: 60,
        // width: MediaQuery.of(context).size.width - 50,
        child: TextField(
          //onChanged: onChangeSearchField,
          controller: _searchFieldController,
          onTap: () {
            //isOnSearch = true;
          },
          onSubmitted: (value) {
            setState(() {
              //   if (value.length == 0) {
              //     messageText = "";
              //   } else {
              //     messageText = "No products availabel in this category";
              //   }
              //   _isLoading = true;
              //   products.clear();
              //   getProductsList(value);
            });

            print("search");
          },
          decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              // fillColor: Colors.green,

              isDense: true,
              contentPadding: EdgeInsets.all(8),
              hintText: 'Search',
              hintStyle: TextStyle(fontSize: 14),
              prefixIcon: Icon(
                Icons.search,
                size: 30,
              )),
        ));
  }
}
