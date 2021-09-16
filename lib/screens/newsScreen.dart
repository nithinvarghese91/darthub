// @dart=2.8

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

// import 'package:gstcentral/main.dart';
// import 'package:gstcentral/screens/login.dart';
// import 'home_screen.dart';
// import 'login_screen.dart';
import 'package:flutter/services.dart';
import 'package:welcome/components/customListTile.dart';
import 'package:welcome/model/article_model.dart';
import 'package:welcome/provider/demoProvider.dart';
import 'package:welcome/screens/detailsScreen.dart';
import 'package:welcome/screens/drawerScreen.dart';
import 'package:welcome/screens/lohin.dart';
import 'package:welcome/screens/searchScreen.dart';
// import 'package:gstcentral/constants.dart';

//new credentials for main scree
// import './login.dart';
// import './home.dart';
import 'package:welcome/services/api_service.dart';
import 'package:welcome/widgets/widgets.dart';
// import 'package:welcome/components/customListTile.dart';
// import '../model/article_model.dart';

class HomePage extends StatefulWidget {
  User user;

  final _auth = FirebaseAuth.instance;
  HomePage({Key key, this.user});
  //   : assert(user != null),
  //  super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final search = TextEditingController();
  int cont = 0;

  //List<ItemModel> items;
  String errorMessage;
  passData() {}
  int change = 1;

  double h = 200;
  double w = 600;

  @override
  void initState() {
    super.initState();
    if (!mounted) return;

    // getItemsStream();
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int changeColor = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerScreen(),
        backgroundColor: Colors.white,
        //  appBar: appBarMainPage(context),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  backgroundColor: Colors.green,
                  automaticallyImplyLeading: false,
                  floating: true,
                  stretch: true,
                  snap: true,
                  centerTitle: false,
                  // pinned: true,
                  // expandedHeight: 256.0,

                  flexibleSpace: appBarMainPage(context)),
            ];
          },
          body: Container(
            //padding: EdgeInsets.only(bottom: 5),
            child: Column(
              children: [MainBody(context), fetchedData()],
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigation(context),
      ),
    );
  }

  Column bodyTileColumn(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: 10,
        // ),
        Container(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 6.5),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25), //color of shadow
              spreadRadius: .50, //spread radius
              blurRadius: 0.10, // blur radius
              // offset: Offset(1, 1)
            )
          ]),
          child: GestureDetector(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * .40,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                top: 12,
                left: 12,
                right: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Image.asset('assets/svg/image1.jpg',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill),
                  ),
                  // SizedBox(
                  //   height: 18,
                  // ),
                  Spacer(
                    flex: 4,
                  ),
                  Text("Centre Releases Rs.1.04 lakh Crore for",
                      style: TextStyle(
                          color: Color(0xFFFF323C45),
                          fontSize: 16,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w600)),

                  Spacer(
                    flex: 1,
                  ),
                  Text("Compensation Shortfall under GST",
                      style: TextStyle(
                          color: Color(0xFFFF323C45),
                          fontSize: 16,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w600)),

                  Spacer(
                    flex: 3,
                  ),
                  Row(
                    children: [
                      Text("Updated March 02, 2021     2 Min Read",
                          style: TextStyle(
                            color: Color(0xFFFF939393),
                            fontSize: 10,
                            fontFamily: 'inter',
                          )),
                      Spacer(
                        flex: 5,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Transform.scale(
                            alignment: Alignment.bottomCenter,
                            scale: 1.4,
                            child: SvgPicture.asset(
                              'assets/svg/share.svg',
                              color: Color(0xFFFF323C45),
                            ),
                          ),
                        ],
                      ),
                      Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => DetailsScreen()));
            },
          ),
        ),
        // Divider(
        //   height: 1.5,
        // ),
        SizedBox(
          height: 7,
        ),
        // Divider(
        //   height: 1.5,
        // ),
      ],
    );
  }
}
