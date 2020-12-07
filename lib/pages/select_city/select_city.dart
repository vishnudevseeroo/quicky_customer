import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quicky_customer/pages/Api_service/api_service.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/localization/language_constants.dart';
import 'package:quicky_customer/pages/success/success_screen.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';

import 'models/citylist.dart';

class SelectCity extends StatefulWidget {
  static const routeName = '/selectcity';

  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  TextEditingController _searchFieldController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<CityList> mcitylist = List<CityList>();
  List<CityList> mFilterList = List<CityList>();
  bool _isInAsyncCall = true;

  // CityList mcitylist;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllList().then((response) {

      setState(() {
        mcitylist = response;
        bool _isInAsyncCall = false;
      });
      print("list of all cities");
      print(response[0].title);
      print(mcitylist.length);
    });
    _searchFieldController.addListener(() {
      if (_searchFieldController.text.isEmpty) {
        setState(() {
          mFilterList = mcitylist;
          hideKeyboard();

        });
      }else{
        filterSearch();
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    bool isSearching = _searchFieldController.text.isNotEmpty;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body:ModalProgressHUD (
          child: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  commonToolbar(context, 'select_city', true),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30, top: 15, bottom: 0),
                    child: searchField(),
                  ),
                  Expanded(child: buildListView(context,isSearching)),
                ],
              ),
            ),
          ),
          inAsyncCall: _isInAsyncCall,
          // demo of some additional parameters
          opacity: 0.5,
          progressIndicator: CircularProgressIndicator(),
        ));
  }

  buildListView(BuildContext context, bool isSearching) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 30,
      ),
      child: ListView.builder(
          itemCount: isSearching ? mFilterList.length : mcitylist.length,
          itemBuilder: (context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SuccessScreen()));
              },
              child: ListTile(
                  leading: Icon(Icons.list),
                  title: Text(
                    isSearching
                        ? "${mFilterList[index].title}"
                        : "${mcitylist[index].title}",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  )),
            );
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

  void filterSearch() {
    List<CityList> citylist = [];
    citylist.addAll(mcitylist);
    if (_searchFieldController.text.isNotEmpty) {
      citylist.retainWhere((list) {
        String searchTerm = _searchFieldController.text.toLowerCase();
        String cityName = list.title.toLowerCase();
        return cityName.contains(searchTerm);
      });
      setState(() {
        mFilterList = citylist;
      });

      if (mFilterList == null || mFilterList.length == 0) {
        showSnackBar(_scaffoldKey, "No Records");
      }
    } else {
      setState(() {
        mFilterList = mcitylist;
      });
    }
  }

  void hideKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  showSnackBar(GlobalKey<ScaffoldState> key, String message) {
    key.currentState.showSnackBar(SnackBar(
      backgroundColor: primaryColor,
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
    ));
  }
}
