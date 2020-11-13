import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';

class SelectCity extends StatefulWidget {
  static const routeName = '/selectcity';

  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  TextEditingController _searchFieldController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                commonToolbar(context, 'select_city', true),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30, top: 15, bottom: 0),
                  child: searchField(),
                ),
                Expanded(child: listView(context)),
              ],
            ),
          ),
        ));
  }

  listView(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 30,
      ),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, int index) {
            return ListTile(
                leading: Icon(Icons.list),
                title: Text(
                  "List item $index",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ));
          }),
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
              hintText: buildTranslate(context, 'search'),
              hintStyle: TextStyle(fontSize: 14),
              prefixIcon: Icon(
                Icons.search,
                size: 30,
              )),
        ));
  }
}
