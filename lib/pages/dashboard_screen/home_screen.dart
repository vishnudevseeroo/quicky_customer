import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/navigation_drawer/NavigationDrawerScreen.dart';
import 'package:quicky_customer/pages/restuarant_details/restaurantlist.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  Color colorCode = Colors.lightBlue;
  Random random = new Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //checkIfNewVersionAvailable();
  }

  var colors = [
    Colors.red,
    Colors.blue,
    Colors.cyan,
    Colors.green,
    Colors.yellow,
  ];

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.transparent,
  //     key: _scaffoldKey,
  //     drawer: NavigationDrawer(),
  //     body: buildBody(context),
  //     appBar: AppBar(
  //       elevation: 0,
  //       backgroundColor: Colors.transparent,
  //       leading: IconButton(
  //         onPressed: () {

  //         },
  //         icon: Icon(
  //           Icons.menu,
  //           color: Colors.black,
  //         ),
  //       ),
  //       actions: <Widget>[
  //         GestureDetector(
  //           onTap: () async {},
  //           child: Stack(children: <Widget>[
  //             Center(
  //               child: IconButton(
  //                 icon: Icon(
  //                   Icons.shopping_cart,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //             ),
  //             // context.watch<CartCounter>().count != 0
  //             //     ? Positioned(
  //             //         right: 8,
  //             //         top: 10,
  //             //         child: Consumer<CartCounter>(
  //             //           builder: (_, counter, __) {
  //             //             return Container(
  //             //                 padding: EdgeInsets.all(2),
  //             //                 decoration: BoxDecoration(
  //             //                   color: Colors.red,
  //             //                   borderRadius: BorderRadius.circular(7.5),
  //             //                 ),
  //             //                 constraints:
  //             //                     BoxConstraints(minWidth: 15, minHeight: 15),
  //             //                 child: Text('${counter.count}',
  //             //                     style: TextStyle(
  //             //                         color: Colors.white, fontSize: 11),
  //             //                     textAlign: TextAlign.center));
  //             //           },
  //             //         ),
  //             //       )
  //             //     : Container()
  //           ]),
  //         )
  //       ],
  //     ),
  //   );
  // }

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
        // ContactUsBottomBar(
        //   email: widget.products.email,
        // )
      ],
    );
  }

  Widget buildFeaturedCard() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(buildTranslate(context,
            'featured'),
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
                            Navigator.push(
                                context,
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
                            // child: Image.asset(
                            //   'assets/images/burger.png',
                            // ),
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
                      // child: Image.asset(
                      //   'assets/images/${widget.products.logo}',
                      //   width: 24,
                      //   height: 24,
                      // ),
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
          Text(buildTranslate(context,
            'categories'),
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
      itemCount: branches.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                //color: Color.fromRGBO(245, 245, 245, 1),
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
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
                  branches[index],
                  style: TextStyle(fontSize: 13),
                ))
              ],
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
        body: SafeArea(
          child: buildBody(context),
        ),
      ),
    ]);
  }
}
