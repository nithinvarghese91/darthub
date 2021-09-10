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
// import 'package:welcome/components/customListTile.dart';
// import '../model/article_model.dart';

class HomePage extends StatefulWidget {
  final User user;

  final _auth = FirebaseAuth.instance;
  HomePage({Key key, this.user})
      : assert(user != null),
        super(key: key);
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
    return Scaffold(
      drawer: DrawerScreen(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return Transform.scale(
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
            scale: .98,
            child: Image.asset(
              'assets/svg/gstcentral 1.jpg',
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 14, right: 16),
            child: Transform.scale(
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
          ),
        ],
      ),
      body: Container(
        //padding: EdgeInsets.only(bottom: 5),
        child: MainBody(context),
      ),
      bottomNavigationBar: Container(
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
            bottomColumn(text: 'Home 2 1.svg', textTwo: "Home"),
            bottomColumn(text: 'bottom2.svg', textTwo: "fgdfh"),
            bottomColumn(text: 'bottom3.svg', textTwo: "Tools"),
            bottomColumn(text: 'Home 2 1.svg', textTwo: "Learn"),
            bottomColumn(text: 'Home 2 1.svg', textTwo: "Ddvdates")
          ],
        ),
      ),
    );
  }

  Column MainBody(BuildContext context) {
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
                      //   setState(() {
                      //     changeColor = 1;
                      //   });
                      Provider.of<DemoProvider>(context, listen: false)
                          .tabIndicator1();
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
        Padding(
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
                            color:
                                Colors.black.withOpacity(.25), //color of shadow
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
                  ))
            ],
          ),
        ),
        cont == 0
            ? Divider(height: 2)
            : Container(
                height: 0.35,
                decoration: BoxDecoration(
                    color: Color(0xffffDEFFF8),
                    borderRadius: BorderRadius.circular(6),
                    // border: Border.all(color: Colors.grey, width: .05),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.25), //color of shadow
                        spreadRadius: 1.2, //spread radius
                        blurRadius: 0.30, // blur radius
                        // offset: Offset(1, 0)
                      )
                    ])),
        Expanded(
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
                cont = 1;
                //Now let's make a list of articles
                //List<Article> articles = snapshot.data;
                List<Articles> articles = snapshot.data;
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  //Now let's create our custom List tile
                  itemCount: articles.length,
                  itemBuilder: (context, index) =>
                      bodyTileCol(articles[index], context),
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
        ),
      ],
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

  Material bottomColumn({String text, String textTwo}) {
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
        onTap: () {},
      ),
    );
  }
}
