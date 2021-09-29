// @dart=2.8

import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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
import 'package:welcome/pages/gudes.dart';
import 'package:welcome/provider/demoProvider.dart';
import 'package:welcome/screens/OTPiinput.dart';
import 'package:welcome/screens/detailsScreen.dart';
import 'package:welcome/screens/drawerScreen.dart';
import 'package:welcome/screens/lohin.dart';
import 'package:welcome/screens/noInternet.dart';
import 'package:welcome/screens/searchScreen.dart';
import 'otpScreen.dart';
// import 'package:gstcentral/constants.dart';

//new credentials for main scree
// import './login.dart';
// import './home.dart';
import 'package:welcome/services/api_service.dart';
import 'package:welcome/widgets/widgets.dart';
// import 'package:welcome/components/customListTile.dart';
// import '../model/article_model.dart';
import 'package:connectivity/connectivity.dart';

class HomePage extends StatefulWidget {
  User user;

  final _auth = FirebaseAuth.instance;
  HomePage({
    Key key,
    this.user,
  });
  //   : assert(user != null),
  //  super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin {
  TabController _tabController;

  StreamSubscription subscription;
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

    //FirebaseCrashlytics.instance.crash();
    if (!mounted) return;
    _tabController = TabController(
      initialIndex: 0,

      length: 2,
      vsync: this,
    );


    super.initState();

    Provider.of<DemoProvider>(context, listen: false).netConnection();
    Provider.of<DemoProvider>(context, listen: false).startMonitoring();

    print('user is');
    print(widget.user);
    //netConnection();

    // getItemsStream();

    Timer(const Duration(seconds: 5), () {
      setState(() {
        Provider.of<DemoProvider>(context, listen: false).circleColorChanger();
      });
    });
  }

  // int netId;
  // networkCheck() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     // ignore: unnecessary_statements
  //     setState(() {
  //       netId = 1;
  //     });
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     setState(() {
  //       netId = 1;
  //     });
  //   } else {
  //     setState(() {
  //       netId = 0;
  //     });
  //   }
  // }

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

      // backgroundColor: Colors.white,
      //  appBar: appBarMainPage(context),
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            var index = _tabController.index;

        return <Widget>[

          SliverAppBar(
            backgroundColor:
            Provider.of<DemoProvider>(context).themeMode == ThemeMode.dark
                ? Colors.grey.shade900
                : Colors.white,
            elevation: 0,
            //toolbarHeight:50 ,
            leading: Builder(
              builder: (BuildContext context) {
                return Transform.scale(
                  // alignment: Alignment.bottomCenter,
                  scale: .45,
                  child: GestureDetector(
                      child: SvgPicture.asset(
                        'assets/svg/person.svg',
                        color: Provider.of<DemoProvider>(context).themeMode ==
                            ThemeMode.dark
                            ? Colors.white
                            : null,
                      ),
                      onTap: () {
                        print('drawer');
                        Scaffold.of(context).openDrawer();
                      }),
                );

                //  IconButton(
                //   icon: const Icon(Icons.menu),
                //   onPressed: () {
                //     Scaffold.of(context).openDrawer();
                //   },
                //   tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                // );
              },
            ),
            title: Padding(
              padding: const EdgeInsets.only(
                left: 5,
              ),
              child: Transform.scale(
                scale: .68,
                child: SvgPicture.asset(
                  'assets/svg/logo.svg',
                ),
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 14, right: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 17,
                    ),
                    Transform.scale(
                      scale: 1,
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          'assets/svg/lens.svg',
                          color: Provider.of<DemoProvider>(context).themeMode ==
                              ThemeMode.dark
                              ? Colors.white
                              : null,
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SearchScreen()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],

            //backgroundColor: Colors.gre en,
            //automaticallyImplyLeading: false,
            //  title:  appBarMainPage(context),


              floating: true,
            //  stretch: true,
              //snap: true,
              pinned: true,
             // centerTitle: false,

               //pinned: true,
              // expandedHeight: 256.0,
              bottom:new PreferredSize(
                preferredSize: new Size(55.0, 55.0),
                child: new Container(
                  width: 250.0,
                  height:55,

                  padding: EdgeInsets.only(bottom:20,top:10),
                  child: new TabBar(
                    labelStyle: TextStyle(
                      //  color: Color(0xFFFF323C45),
                        fontSize: 14,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w600),
                      indicatorWeight:4,
                    controller: _tabController,
                    indicator:UnderlineTabIndicator(
                      borderSide: BorderSide(color: Colors.teal,width: 4, ),
                     insets: EdgeInsets.only(left:18,right:18)
                    ),
                    tabs: [
                      new Container(
                         height: 20 ,
                        child: new Tab(text: 'Gst News'
                        ),
                      ),
                      new Container(
                         height: 20 ,
                        child: new Tab(text: 'Guides'),
                      ),
                    ],
                  ),
                ),
              ),
            //  flexibleSpace: appBarMainPage(context)
              ),

            ];
          },
          body:




             TabBarView(
               controller: _tabController,
               children: <Widget>[
             Container(

             //      //padding: EdgeInsets.only(bottom: 5),
                   child:
                   Column(
                     children: [fetchedData()],

                   ),
                ),
                 Center(
                   child:guides(context)
                   //GestureDetector(child: Text("It's rainy here"),
                   // onTap:(){
                   //   Navigator.push(context,MaterialPageRoute(builder:(context) => CustomSliverAppbar()));
                   // },
                // ),
                 )
                 // Center(
                 //   child: Text("It's sunny here"),
                 // ),
               ],
             ),
             // Container(
             //      //padding: EdgeInsets.only(bottom: 5),
             //      child: Column(
             //        children: [MainBody(context), fetchedData()],
             //      ),
             //    ),

      ),
      bottomNavigationBar: bottomNavigation(context),
    ));
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

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

}


Widget guides(BuildContext context){
   Provider.of<DemoProvider>(context, listen: false)
       .tabIndicator2();
  return Center(child: Text("guides"),);


}

Widget guides1(BuildContext context){
  Provider.of<DemoProvider>(context, listen: false)
      .tabIndicator1();
  return Center(child: Text("guides"),);


}