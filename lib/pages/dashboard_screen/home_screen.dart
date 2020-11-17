import 'package:flutter/material.dart';
import 'package:quicky_customer/pages/navigation_drawer/NavigationDrawerScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //checkIfNewVersionAvailable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
          child: SizedBox(
            height: 16,
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: false,
        actions: <Widget>[
          // InkWell(
          //     child: Container(
          //       width: 250,
          //       margin: const EdgeInsets.all(4),
          //       decoration: BoxDecoration(
          //         border: Border.all(width: 1, color: Colors.orange),
          //         color: Colors.white,
          //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
          //       ),
          //       padding: EdgeInsets.all(10.0),
          //       child: Row(
          //         children: [
          //           Icon(
          //             Icons.search,
          //             size: 30,
          //             color: Colors.orange,
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Text(
          //             "What are you looking for ?",
          //             style: TextStyle(fontSize: 14, color: Colors.orange),
          //           )
          //         ],
          //       ),
          //     ),
          //     onTap: () {}),
        ],
      ),
      body: SafeArea(
          child: Center(
        child: Text("home screen"),
      )),
    );
  }
}
