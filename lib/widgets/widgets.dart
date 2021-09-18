import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:welcome/components/customListTile.dart';
//import 'package:welcome/constants/constants.dart';
import 'package:welcome/model/article_model.dart';
import 'package:welcome/pages/gudes.dart';
import 'package:welcome/provider/demoProvider.dart';
import 'package:welcome/screens/calendar.dart';
import 'package:welcome/screens/newsScreen.dart';
import 'package:welcome/screens/searchScreen.dart';
import 'package:welcome/screens/slider.dart';
import 'package:welcome/services/api_service.dart';
import 'package:welcome/screens/drawerScreen.dart';

ApiService client = ApiService();

User user;
roundIndicator() {
  Timer(const Duration(seconds: 5), () {
    BuildContext context;
    Provider.of<DemoProvider>(context, listen: false).circleColorChanger();
  });
}

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final _auth = FirebaseAuth.instance;

//main body widget containing dismiss button

Widget gstNews(context) {
  return Scaffold(
    appBar: appBarMainPage(context),
    drawer: DrawerScreen(),
    bottomNavigationBar: bottomNavigation(context),
    body: Column(
      children: [MainBody(context), fetchedData()],
    ),
  );
}

Widget MainBody(BuildContext context) {
  User user;

  return Column(
    children: [
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Container(
            // padding: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // TextButton(
                //   onPressed: () {},
                //   child: Text("Gst News",
                //       style: TextStyle(color: Colors.grey[800])),
                // ),
                GestureDetector(
                  child: Text("Gst News",
                      style: TextStyle(
                          color: Color(0xFFFF323C45),
                          fontSize: 14,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w600)),
                  onTap: () {
                    //roundIndicator();
                    //   setState(() {
                    //     changeColor = 1;
                    //   });
                    Provider.of<DemoProvider>(context, listen: false)
                        .tabIndicator1();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  user: user,
                                )));
                  },
                ),
                SizedBox(
                  height: 2,
                ),

                Provider.of<DemoProvider>(context).tabColor1()
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            // padding: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // TextButton(
                //   onPressed: () {},
                //   child: Text("Gst News",
                //       style: TextStyle(color: Colors.grey[800])),
                // ),
                GestureDetector(
                  child: Text("Guides",
                      style: TextStyle(
                          color: Color(0xFFFF323C45),
                          fontSize: 14,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w600)),
                  onTap: () {
                    Provider.of<DemoProvider>(context, listen: false)
                        .tabIndicator2();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Guides()));

                    // setState(() async {
                    //   changeColor == 0;
                    //   print(0);

                    //   await _firebaseAuth.signOut();
                    //   Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => PhoneLogin()));
                    // });
                  },
                ),
                SizedBox(
                  height: 2,
                ),

                Provider.of<DemoProvider>(context).tabColor2()
              ],
            ),
          ),
          Spacer(),
        ],
      ),
      // Padding(
      //   padding: const EdgeInsets.only(bottom: 48.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     // crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Spacer(),
      //       Container(
      //         padding: EdgeInsets.only(bottom: 25, left: 44),
      //         height: 4,
      //         width: 60,
      //         decoration: BoxDecoration(
      //             color: Colors.teal,
      //             borderRadius: BorderRadius.circular(40)),
      //       ),
      //       Container(
      //         height: 4,
      //         width: 60,
      //         decoration: BoxDecoration(
      //             color: Colors.teal,
      //             borderRadius: BorderRadius.circular(40)),
      //       ),
      //       Spacer(),
      //     ],
      //   ),
      // )
      // gstDirectory(context),

      // : Container(
      //     height: 0.35,
      //     decoration: BoxDecoration(
      //         color: Color(0xffffDEFFF8),
      //         borderRadius: BorderRadius.circular(6),
      //         // border: Border.all(color: Colors.grey, width: .05),
      //         boxShadow: [
      //           BoxShadow(
      //             color: Colors.black.withOpacity(.25), //color of shadow
      //             spreadRadius: 1.2, //spread radius
      //             blurRadius: 0.30, // blur radius
      //             // offset: Offset(1, 0)
      //           )
      //         ])),
      SizedBox(
        height: 12,
      )
    ],
  );
}

Widget gstDirectory(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 14, bottom: 14, left: 18, right: 19),
    child: Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * .16,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color(0xffffDEFFF8),
                borderRadius: BorderRadius.circular(6),
                // border: Border.all(color: Colors.grey, width: .05),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.25), //color of shadow
                      spreadRadius: 0.10, //spread radius
                      blurRadius: .05, // blur radius
                      offset: Offset(0, 1))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(
                  flex: 3,
                ),
                Container(
                  child: Transform.scale(
                    scale: 1.1,
                    child: SvgPicture.asset(
                      'assets/svg/contacts.svg',
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Text("Introducing GST Directory",
                        style: TextStyle(
                            color: Color(0xFFFF323C45),
                            fontSize: 14,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    Text("Complete Gst Related information in one place",
                        style: TextStyle(
                          color: Color(0xFFFF323C45),
                          fontSize: 12,
                          fontFamily: 'inter',
                        )),
                    Spacer(),
                    Row(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .30,
                      ),
                      Text("Dismiss",
                          style: TextStyle(
                              color: Color(0xFFFF000000),
                              fontSize: 12,
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 22,
                      ),
                      Text("Check it Out !",
                          style: TextStyle(
                              color: Color(0xFFFF000000),
                              fontSize: 12,
                              fontFamily: 'bolded',
                              fontWeight: FontWeight.bold)),
                    ]),
                    Spacer(
                      flex: 1,
                    )
                  ],
                ),
                Spacer(
                  flex: 1,
                )
              ],
            )),
        Divider(height: 2),
      ],
    ),
  );
}

//future builder snapshot data fetching
Widget fetchedData({BuildContext context}) {
  return Expanded(
    child: FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context,
          AsyncSnapshot<
                  List<
                      //Article
                      Articles>>
              snapshot) {
        //let's check if we got a response or not
        if (snapshot.hasData) {
          // cont = 1;
          //Now let's make a list of articles
          //List<Article> articles = snapshot.data;
          List<Articles> articles = snapshot.data;
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            //Now let's create our custom List tile
            itemCount: articles.length,
            itemBuilder: (context, index) {
              print(articles.length);
              return bodyTileCol(articles[index], context);
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ),

    //  ListView.builder(
    //   physics: BouncingScrollPhysics(),
    //   shrinkWrap: true,
    //   itemCount: 10,
    //   itemBuilder: (context, index) {
    //     return bodyTileColumn(context);
    //   },
    // ),
  );
}

//bottomnavigation buttons

Material bottomColumn(
  context, {
  String text,
  String textTwo,
}) {
  User user;
  return Material(
    color: Colors.transparent,
    child: InkWell(
      splashColor: Colors.greenAccent.withOpacity(.40),
      highlightColor: Colors.blueAccent.withOpacity(.25),
      //borderRadius: BorderRadius.circular(10),
      radius: 42,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Spacer(),
            Transform.scale(
              alignment: Alignment.topCenter,
              scale: 1,
              child: SvgPicture.asset(
                'assets/svg/$text',
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              textTwo,
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'inter',
                  color: Color(0xFFFF939393)),
            ),
            Spacer()
          ],
        ),
      ),
      onTap: () {
        if (textTwo == 'Home') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        user: user,
                      )));
        } else if (textTwo == "Glance") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Glance()));
        } else if (textTwo == 'Calendar') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CalendarScreen()));
        } else {
          print('other bottombar button');
        }

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Glance()));
      },
    ),
  );
}

//AppBar main page

Widget appBarMainPage(context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: Builder(
      builder: (BuildContext context) {
        return Transform.scale(
          // alignment: Alignment.bottomCenter,
          scale: .45,
          child: GestureDetector(
              child: SvgPicture.asset(
                'assets/svg/person.svg',
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
  );
}

//bottom navigation main bar
Widget bottomNavigation(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 75,
    decoration: BoxDecoration(color: Colors.white,
        // border: Border.symmetric(
        //     horizontal: BorderSide(width: 2, color: Colors.grey[200]))
        boxShadow: [
          BoxShadow(
              color: Colors.grey[200], //color of shadow
              spreadRadius: 2, //spread radius
              blurRadius: .2, // blur radius
              offset: Offset(1.5, 0))
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          child: bottomColumn(context, text: 'Home 2 1.svg', textTwo: "Home"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => gstNews(context)));
          },
        ),
        GestureDetector(
          child: bottomColumn(context, text: 'bottom2.svg', textTwo: "Glance"),
          onTap: () {
            print("glance loading");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Glance()));
          },
        ),
        bottomColumn(context, text: 'bottom3.svg', textTwo: "Calendar"),
        bottomColumn(context, text: 'Home 2 1.svg', textTwo: "Learn"),
        bottomColumn(context, text: 'Home 2 1.svg', textTwo: "Ddvdates")
      ],
    ),
  );
}
