import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:welcome/screens/lohin.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return Container(
      color: Colors.white,
      // width: MediaQuery.of(context).size.width * .65,
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        Transform.scale(
                          scale: 1,
                          child:
                              // Text('hi')
                              Image.asset('assets/svg/bribin.jpg'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Bibin George Philip",
                                  style: TextStyle(
                                      wordSpacing: 1,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                //Spacer(),
                                Container(
                                  height: 12,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF0098DE),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(1),
                                        bottomRight: Radius.circular(3),
                                        bottomLeft: Radius.circular(3),
                                        topRight: Radius.circular(1)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Text("+91 9656958282",
                                style: TextStyle(
                                    wordSpacing: 1,
                                    fontSize: 11,
                                    color: Color(0xFFFF323C45)))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .06,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Color(0xffff0098DE),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Transform.scale(
                      scale: 1.2,
                      child: SvgPicture.asset('assets/svg/rocket.svg')),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Become a Pro Member ',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('Get Access to Advanced features',
                          style: TextStyle(fontSize: 8, color: Colors.white))
                    ],
                  )
                ],
              ),
            ),
            drawerTiles(context,
                svg: 'Bookmark',
                text: 'My Bookmarks',
                height: 0,
                width: 0,
                scale: 1),
            drawerTiles(context,
                svg: 'directory',
                text: 'GST Directory',
                height: 17,
                width: 25,
                scale: 1),
            drawerTiles(context,
                svg: 'about',
                text: 'About gstcentral',
                height: 0,
                width: 0,
                scale: 1.5),
            drawerTiles(context,
                svg: 'privacy',
                text: 'Privacy Policy',
                height: 0,
                width: 0,
                scale: 1.5),
            drawerTiles(context,
                svg: 'message',
                text: 'Contact Support',
                height: 0,
                width: 0,
                scale: 1),
            drawerTiles(context,
                svg: 'video',
                text: 'Tutorials',
                height: 0,
                width: 0,
                scale: 1.5),
            drawerTiles(context,
                svg: 'iconshare',
                text: 'Share with friends',
                height: 0,
                width: 0,
                scale: 1),
            GestureDetector(
              child: drawerTiles(context,
                  svg: 'logout',
                  text: 'Logout',
                  height: 0,
                  width: 0,
                  scale: 1.5),
              onTap: () async {
                await _firebaseAuth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PhoneLogin()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Container drawerTiles(BuildContext context,
      {String svg, String text, double height, double width, double scale}) {
    return Container(
        height: MediaQuery.of(context).size.height * .07,
        padding: EdgeInsets.only(left: 20, right: 20),
        //color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 25,
                  height: 20,
                  margin: EdgeInsets.only(right: 16),
                  child: Transform.scale(
                    scale: scale,
                    child: SvgPicture.asset('assets/svg/$svg.svg'),
                  ),
                ),
                // SizedBox(
                //   width: 20,
                // ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xffff00866A).withOpacity(.76)),
                  child: Center(
                    child: Text(
                      "NEW",
                      style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
