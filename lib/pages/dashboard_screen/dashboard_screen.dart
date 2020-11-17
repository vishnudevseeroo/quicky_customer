import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/navigation_drawer/NavigationDrawerScreen.dart';
import 'package:quicky_customer/pages/profile/profile.dart';
import 'package:quicky_customer/utils/ColorUtil.dart';
import 'package:quicky_customer/utils/FontSizeUtil.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime currentBackPressTime;

  static const List<String> cardList = [
    'Pending Order',
    'Dispatched Order',
    'Delivered Order',
    'Cancelled/Rejected Orders'
  ];

  static const List<String> cardListMal = [
    'പെൻഡിങ്‌ ഓർഡർ',
    'അയച്ച ഓർഡർ',
    'കൈമാറിയ ഓർഡർ',
    'റദ്ദാക്കിയ / നിരസിച്ച ഓർഡർ'
  ];

  static const List<Icon> cardIconList = [
    Icon(
      Icons.bookmark_border,
      color: Colors.black38,
    ),
    Icon(Icons.delivery_dining, color: Colors.black38),
    Icon(Icons.baby_changing_station_sharp, color: Colors.black38),
    Icon(Icons.cancel_outlined, color: Colors.black38)
  ];

  static const List<String> productIconList = [
    'assets/images/tomatto.png',
    'assets/images/capsicum.png',
    'assets/images/pottatto.png',
  ];

  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 1:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
          break;
        case 3:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
          break;
        default:
          _selectedIndex = index;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child:
              _selectedIndex == 0 ? getHomeLayout() : getNotificationLayout(),
        ),
        bottomNavigationBar: generateBottomNavigationBar(),
        drawer: NavigationDrawer(),
      ),
    );
  }

  Widget getHomeLayout() {
    return Container(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              generateTopBatLayout(),
              latestOrderHeading(),
              latestOrderList()
            ],
          ),
        ),
      ),
    );
  }

  Widget getNotificationLayout() {
    return Container(
      child: Column(
        children: [
          toolBarForNotification(
              context, buildTranslate(context, 'notification'), true),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return notificationChildItem();
              },
              itemCount: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget toolBarForNotification(@required BuildContext context,
      @required String pageTitle, @required bool isGreen) {
    return Stack(
      children: [
        FlatButton(
          shape: CircleBorder(),
          color: isGreen ? primaryColor : Colors.white,
          onPressed: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: isGreen ? Colors.white : primaryColor,
          ),
        ),
        Container(
          width: double.infinity,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            pageTitle,
            style: isGreen
                ? TextStyle(
                    color: Colors.black,
                    fontSize: normalSize,
                    fontWeight: FontWeight.bold)
                : TextStyle(
                    color: Colors.white,
                    fontSize: normalSize,
                    fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget generateBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.black54,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/home.png'),
          label: buildTranslate(context, 'home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: buildTranslate(context, 'my_products'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: buildTranslate(context, 'notification'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          label: buildTranslate(context, 'account'),
        ),
      ],
    );
  }

  Widget generateTopBatLayout() {
    return Container(
      decoration: BoxDecoration(
          color: dashBoardCardViewColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70))),
      padding: EdgeInsets.only(bottom: 19),
      child: Column(
        children: [
          getToolBar(),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: GridView.count(
              // childAspectRatio: 1.2,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 7,
              shrinkWrap: true,
              children: [
                generateGridChild(0),
                generateGridChild(1),
                generateGridChild(2),
                generateGridChild(3)
              ],
            ),
            margin: EdgeInsets.only(left: 18, right: 18),
          ),
        ],
      ),
    );
  }

  Widget generateGridChild(int position) {
    return Column(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: Card(
              color: dashBoardCardColor,
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      '1000',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: heading1),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: cardIconList.elementAt(position),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
            ),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          buildTranslate(
            context,
            cardList.elementAt(position),
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget getToolBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (BuildContext _context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(_context).openDrawer();
              },
            );
          },
        ),
        Image.asset(
          'assets/images/logo.png',
          height: 45,
          width: 45,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
          child: Container(
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 18.0,
              backgroundImage: AssetImage('assets/images/logo1.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }

  Widget latestOrderHeading() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              buildTranslate(context, 'latest_orders'),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: heading3),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: Text(
              buildTranslate(context, 'see_all'),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: normalSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget latestOrderList() {
    return Container(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, i) {
            return generateListChild(i);
          }),
    );
  }

  Widget generateListChild(int i) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
        },
        child: Card(
            child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 13, bottom: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              orderDetails(),
              SizedBox(
                width: 85,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 3
                        ? generateCardMoreItem()
                        : generateOrderTile(index);
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget generateOrderTile(int index) {
    print(productIconList.elementAt(index));
    return Card(
      color: dashBoardSmallCardColor,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Image.asset(productIconList.elementAt(index)),
      ),
    );
  }

  Widget generateCardMoreItem() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            '+4',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: normalSize),
          ),
        ),
      ),
    );
  }

  Widget orderDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sameep Sudhakaran',
            style: TextStyle(
              color: Colors.black,
              fontSize: heading4,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '+91 9605834569',
            style: TextStyle(color: Colors.black54, fontSize: normalSize),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: primaryColor,
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                child: Text(
                  'Seeroo It Solutions, Kalamassery, Kochi. Pin: 683565, Kerala',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '₹ 299.00',
            style: TextStyle(
                color: Colors.black,
                fontSize: normalSize,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget notificationChildItem() {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('assets/images/logo1.png'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet, cu quo tantas forensibus. Ei denique mandamus his. Usu ad sensibus antiopam, id nullam sensibus sit. Te apeirian pertinax his, nam id debet interesset.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '9 hrs',
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
    );
  }

  Future<bool> onBackPressed() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: buildTranslate(context, 'exit_msg'),
          textColor: Colors.white,
          backgroundColor: primaryColor);
      return Future.value(false);
    }
    SystemNavigator.pop();
    return Future.value(true);
  }
}
