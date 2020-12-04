import 'dart:math';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quicky_customer/pages/Api_service/api_service.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/navigation_drawer/NavigationDrawerScreen.dart';
import 'package:quicky_customer/pages/restuarant_details/restaurantlist.dart';
import 'package:quicky_customer/utils/CommonWidgets.dart';
import 'package:quicky_customer/utils/constants.dart';
import 'package:quicky_customer/utils/snackbar.dart';

import 'model/category_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  Color colorCode = Colors.lightBlue;
  Random random = new Random();

  List<CategoryList> catList = List<CategoryList>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getHomescreenData();
  }

  // Future<void> getCategoryList() async {
  //   bool _isNetWorkavailable = await getNetworkAvailability();
  //   print('is_network_available: ' + _isNetWorkavailable.toString());

  //   if (_isNetWorkavailable) {
  //     setState(() {
  //       isLoading = true;
  //       categoryList();
  //     });
  //   } else {
  //     showSnackBar(_scaffoldKey, buildTranslate(context, 'no_network'));
  //   }
  // }

  // categoryList() {
  //   print('categoryListApi api call working........');
  //   categoryListApi(
  //     userId: '${SharedPrefs.getUserId()}',
  //   ).then((response) {
  //     setState(() {
  //       isLoading = false;

  //       if (response.isNotEmpty) {
  //         catList = response;
  //       } else {
  //         showSnackBar(_scaffoldKey, 'Something went wrong');
  //       }
  //     });
  //   });
  // }

  Future<void> getHomescreenData() async {
    bool _isNetWorkavailable = await getNetworkAvailability();
    print('is_network_available: ' + _isNetWorkavailable.toString());

    if (_isNetWorkavailable) {
      setState(() {
        isLoading = true;
        categoryList();
      });
    } else {
      showSnackBar(_scaffoldKey, buildTranslate(context, 'no_network'));
    }
  }

  categoryList() {
    print('categoryListApi api call working........');
    getHomeScreen(
      userId: '${SharedPrefs.getUserId()}',
    ).then((response) {
      setState(() {
        isLoading = false;

        if (response.businessCategories != null) {
          catList = response.businessCategories;
        } else {
          showSnackBar(_scaffoldKey, 'Something went wrong');
        }
      });
    });
  }

  var colors = [
    Color(0xFF74df4a).withOpacity(0.5),
    Color(0xFFf3d300).withOpacity(0.5),
    Color(0xFFff566a).withOpacity(0.5),
    Color(0xFFf08a68).withOpacity(0.5),
    Color(0xFFd2834b).withOpacity(0.5),
  ];

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                color: Colors.transparent,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 8),
                    buildCategoriesCard(),
                    SizedBox(height: 32),
                    buildFeaturedCard(),
                    SizedBox(height: 8),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildFeaturedCard() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            buildTranslate(context, 'featured'),
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          SizedBox(height: 16),
          buildFeaturedList()
        ],
      ),
    );
  }

  Widget buildFeaturedList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: branches.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    // padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            initialNavigator.currentState.push(
                                MaterialPageRoute(
                                    builder: (context) => RestaurantScreen()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.height / 4,
                            // height: 40,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/burger.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        // height: 40,

                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 20, top: 12, bottom: 12),
                          child: Text("66.77"),
                        )),
                      )),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 30,
                      height: 30,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/logo1.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        "ttt",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "3.9",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        );
      },
    );
  }

  final branches = [
    'Restaurant',
    'Meat',
    'Fruits',
    'Vegitables',
    'Grocery',
    'Home made'
  ];
  Widget buildCategoriesCard() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            buildTranslate(context, 'categories'),
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          SizedBox(height: 16),
          buildCategoriesList()
        ],
      ),
    );
  }

  Widget buildCategoriesList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 2.8),
      shrinkWrap: true,
      itemCount: catList.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Opacity(
            opacity: 0.80,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  //color: Color.fromRGBO(245, 245, 245, 1),
                  color: Colors.primaries[Random().nextInt(colors.length)],
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/logo1.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    catList[index].title,
                    style: TextStyle(fontSize: 13),
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('homepage building');
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        child: Image.asset(
          'assets/images/splash.png',
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: new Center(
              child: Container(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      new Text(
                        "Edappal",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ))),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () async {},
              child: Stack(children: <Widget>[
                Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
        body: ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: CircularProgressIndicator(),
          child: SafeArea(
            child: isLoading
                ? Container()
                : catList?.length == 0
                    ? Center(
                        child: Text('No Data Found'),
                      )
                    : buildBody(context),
          ),
        ),
      ),
    ]);
  }
}
