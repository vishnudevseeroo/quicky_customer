import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/dashboard_screen/home_screen.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/profile/edit_profile.dart';
import 'package:quicky_customer/pages/profile/profile.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = '/dashboard';
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  PageController _myPage = PageController(initialPage: 0);

  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await navigatorKeys[_selectedIndex].currentState.maybePop();
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        bottomNavigationBar: buildBottomNavBar(context),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _myPage,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: <Widget>[
            Navigator(
              key: navigatorKeys[0],
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => HomePage(),
              ),
            ),
            Navigator(
              key: navigatorKeys[1],
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => ProfileScreen(),
              ),
            ),
            Navigator(
              key: navigatorKeys[2],
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => ProfileScreen(),
              ),
            ),
            Navigator(
              key: navigatorKeys[3],
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => EditProfile(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int val, BuildContext context) {
    if (_selectedIndex == val) {
      switch (val) {
        case 0:
          navigatorKeys[0].currentState.popUntil((route) => route.isFirst);
          break;
        case 1:
          navigatorKeys[1].currentState.popUntil((route) => route.isFirst);
          break;
        case 2:
          navigatorKeys[2].currentState.popUntil((route) => route.isFirst);
          break;

        case 3:
          navigatorKeys[3].currentState.popUntil((route) => route.isFirst);
          break;
        default:
      }
    } else {
      if (mounted) {
        setState(() {
          _selectedIndex = val;
          _myPage.jumpToPage(_selectedIndex);
        });
      }
    }
  }

  BottomNavigationBar buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (val) => _onTap(val, context),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text(
            buildTranslate(context, 'home'),
            style: TextStyle(fontSize: 12),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          title: Text(
            buildTranslate(context, 'notification'),
            style: TextStyle(fontSize: 12),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          title: Text(
            buildTranslate(context, 'cart'),
            style: TextStyle(fontSize: 12),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text(
            buildTranslate(context, 'profile'),
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
