import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:welcome/provider/demoProvider.dart';
import 'package:welcome/screens/lohin.dart';
import 'package:welcome/widgets/change_theme_button_widget.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return Container(
        color:
        Provider.of<DemoProvider>(context).themeMode == ThemeMode.dark
        ? Colors.grey.shade900
        : Colors.white,
      // width: MediaQuery.of(context).size.width * .65,
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5,
                // color: Colors.white,
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
                                Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'assets/svg/bribin.jpg',
                                      ),
                                      fit: BoxFit.contain)),

                              //  child: Image.asset('assets/svg/bribin.jpg')
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Bibin George Philip",
                                    style: TextStyle(
                                        wordSpacing: 1,
                                        // color: Colors.grey[800],
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
                              Text(
                                  Provider.of<DemoProvider>(context,
                                          listen: false)
                                      .mobnumber,
                                  style: TextStyle(
                                    wordSpacing: 1,
                                    fontSize: 11,
                                    //color: Color(0xFFFF323C45)
                                  ))
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
                margin: EdgeInsets.only(left: 40, right: 40),
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

              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  children: [
                    Container(
                      padding:EdgeInsets.only(left:3,right: 3),
                      height: MediaQuery.of(context).size.height * .07,
                      // padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Transform.scale(
                            scale: 1,
                            child: Icon(
                                Provider.of<DemoProvider>(context).themeMode ==
                                        ThemeMode.dark
                                    ? Icons.wb_sunny_rounded
                                    : Icons.brightness_2,
                                color: Provider.of<DemoProvider>(context)
                                            .themeMode ==
                                        ThemeMode.dark
                                    ? null
                                    : Colors.grey.shade900),
                          ),
                                  SizedBox(width: 2,),
                          Text(
                              Provider.of<DemoProvider>(context).themeMode ==
                                      ThemeMode.dark
                                  ? "Switch to Light Mode"
                                  : "Switch to Night Mode",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          Transform.scale(
                            scale: .75,
                            child: ChangeThemeButtonWidget(),
                          )
                        ],
                      ),
                    ),
                    Divider(height:.5),
                    Container(
                      height: MediaQuery.of(context).size.height * .07,
                      //  padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: 10),
                          Transform.scale(
                            alignment: Alignment.center,
                            scale: 1,
                            child: Icon(
                              Icons.language,
                              color: Provider.of<DemoProvider>(context)
                                          .themeMode ==
                                      ThemeMode.dark
                                  ? Colors.white
                                  : Colors.grey.shade800,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(Provider.of<DemoProvider>(context).language,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          Spacer(flex: 1),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(

                                  // shape: RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.all(
                                  //         Radius.circular(10.0))),
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          leading: new Text(
                                            'AB',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 2.0),
                                          ),
                                          title: Row(
                                            children: [
                                              SizedBox(
                                                width: 40.0,
                                              ),
                                              new Text(
                                                'English',
                                                style: TextStyle(
                                                  color:
                                                      Provider.of<DemoProvider>(
                                                                      context)
                                                                  .themeMode ==
                                                              ThemeMode.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade800,
                                                  //     // color: Colors.blue,
                                                  //     fontWeight:
                                                  //         FontWeight.bold,
                                                  //
                                                  // letterSpacing: 1.0
                                                ),
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            // setState(() {
                                            //   langTitle = 'English';
                                            //   lang = 0;
                                            //   readData();
                                            // });
                                            Provider.of<DemoProvider>(context,
                                                    listen: false)
                                                .changeLanguage("English");
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: new Text(
                                            'അആ',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.0),
                                          ),
                                          title: Row(
                                            children: [
                                              SizedBox(
                                                width: 40.0,
                                              ),
                                              new Text(
                                                'മലയാളം',
                                                style: TextStyle(
                                                  color:
                                                      Provider.of<DemoProvider>(
                                                                      context)
                                                                  .themeMode ==
                                                              ThemeMode.dark
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade800,
                                                  //     // color: Colors.blue,
                                                  //     fontWeight:
                                                  //         Fo ntWeight.bold,
                                                  //     letterSpacing: 2.0
                                                ),
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            // setState(() {
                                            //   langTitle = 'മലയാളം';
                                            //   lang = 1;
                                            //   readData();
                                            // });
                                            Provider.of<DemoProvider>(context,
                                                    listen: false)
                                                .changeLanguage("മലയാളം");
                                            Navigator.pop(context);
                                          },
                                        ),
                                        // ListTile(
                                        //   leading: new Icon(Icons.videocam),
                                        //   title: new Text('Video'),
                                        //   onTap: () {
                                        //     Navigator.pop(context);
                                        //   },
                                        // ),
                                        // ListTile(
                                        //   leading: new Icon(Icons.share),
                                        //   title: new Text('Share'),
                                        //   onTap: () {
                                        //     Navigator.pop(context);
                                        //   },
                                        // ),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: .45,
                                      color: Provider.of<DemoProvider>(context)
                                                  .themeMode ==
                                              ThemeMode.dark
                                          ? Colors.white
                                          : Colors.grey.shade800),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Transform.scale(
                                  scale: 1.5,
                                  child: Icon(Icons.arrow_drop_down,
                                      color: Provider.of<DemoProvider>(context)
                                                  .themeMode ==
                                              ThemeMode.dark
                                          ? Colors.white
                                          : Colors.grey.shade800),
                                ),
                              ),
                            ),
                          ),
                          Spacer(flex: 3),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              //delete

              drawerTiles(context,
                  svg: 'Bookmark',
                  text: 'My Bookmarks',
                  height: 0,
                  width: 0,
                  scale: 1),
              GestureDetector(
                  child: drawerTiles(context,
                      svg: 'directory',
                      text: 'GST Directory',
                      height: 17,
                      width: 25,
                      scale: 1),
                  onTap: () {}),

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
              GestureDetector(
                child: drawerTiles(context,
                    svg: 'iconshare',
                    text: 'Share with friends',
                    height: 0,
                    width: 0,
                    scale: 1),
                onTap: () {
                  FlutterShare.share(
                    title: 'Share this apllication',
                    //text: article.content,
                    // linkUrl: 'https://flutter.dev/',
                    // chooserTitle: 'Example Chooser Title'
                  );
                },
              ),
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

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      children: [
                        Spacer(),
                        Transform.scale(
                          scale: 1,
                          child: SvgPicture.asset(
                              'assets/svg/Made with ❤️ in India..svg'),
                          alignment: Alignment.bottomCenter,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "by insibe.com       Version 2.0.1",
                          style: TextStyle(fontSize: 9),
                        ),
                        Spacer()
                      ],
                    ),
                    alignment: Alignment.bottomCenter,
                  ),
                ],
              ),

            ],
          ),
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
                    child: SvgPicture.asset(
                      'assets/svg/$svg.svg',
                      color: Provider.of<DemoProvider>(context).themeMode ==
                              ThemeMode.dark
                          ? Colors.white
                          : null,
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 20,
                // ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 14,
                      // color: Provider.of<DemoProvider>(context).themeMode ==
                      //         ThemeMode.dark
                      //     ? Colors.white
                      //     : Colors.grey[800],
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
