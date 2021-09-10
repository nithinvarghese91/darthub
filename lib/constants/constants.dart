// @dart=2.8

import 'dart:io';
import 'dart:ui';
import 'package:flutter_svg/svg.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:welcome/screens/lohin.dart';

// import 'package:google_fonts/google_fonts.dart';
String modelTitle1 = 'Center releases Rs. 1.04 lakh Crore for ';
String modelTitle1A = 'Compensation Shortfall under GST';
String modelTitle2 = 'GST Collection expected to hit a high';
String modelTitleTime = 'Updated March 2,2021    2 Min read';
var india = '+91';
double phonenum = 16;
String phonenumcol = "grey";
String otpcol = '#00866A';
// var fontPhonenum = GoogleFonts.raleway(
//   fontSize: 16,
//   fontWeight: FontWeight.w700,
//   // fontStyle: FontStyle.italic,
// );
double h = 124;
double w = 1;
int textfld = 74;
int tabfld = 84;

class Skipping extends StatefulWidget {
  const Skipping({Key key}) : super(key: key);

  @override
  _SkippingState createState() => _SkippingState();
}

class _SkippingState extends State<Skipping> {
  Future<Widget> _getImage(BuildContext context, String imageName) async {
    Image image;

    // await FireStorageService.loadImage(context, imageName).then((value) {
    //   image = Image.network(
    //     value.toString(),
    //     fit: BoxFit.cover,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(5),
            height: h,
            width: MediaQuery.of(context).size.width * 97.25 / 100 * w,
            decoration: BoxDecoration(
              border: Border.all(width: .5, color: Colors.white),
              borderRadius: BorderRadius.circular(5),
              color: Colors.teal[100],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Transform.scale(
                  scale: .50,
                  child: Image.asset('assets/contacts.JPEG'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 36,
                    ),
                    Text(
                      "Introducing GSt Directory",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Complete GST Related information in one place ",
                      style: TextStyle(fontSize: 12),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1, left: 95),
                      child: Row(
                        children: [
                          TextButton(
                            child: Text(
                              'Dismiss',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            onPressed: () {
                              print('Nothing');

                              setState(() {
                                h = 0;
                                w = 0;
                              });
                            },
                          ),
                          TextButton(
                            child: Text(
                              'Check it out !',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              print('Nothing');

                              setState(() {
                                h = 0;
                                w = 0;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.grey, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
            )
          ]),
          height: .5,
        ),
        // Container(
        //   margin: EdgeInsets.all(5),
        //   height: 200,
        //   width: 300,
        //   decoration: BoxDecoration(border: Border.all(width: 2)),
        //   //color: Colors.black,
        //   child: FutureBuilder(
        //       future: _getImage(context, "books.jpeg"),
        //       // ignore: missing_return
        //       builder: (context, snapshot) {
        //         if (snapshot.connectionState == ConnectionState.done) {
        //           return Container(
        //             width: 25,
        //             height: 22,
        //             child: snapshot.data,
        //           );
        //         }
        //         if (snapshot.connectionState == ConnectionState.waiting) {
        //           return Container(
        //             color: Colors.orange,
        //             width: MediaQuery.of(context).size.width / 1.2,
        //             height: MediaQuery.of(context).size.width / 1.2,
        //             child: CircularProgressIndicator(),
        //           );
        //         }

        //         return Container(
        //           color: Colors.amber,
        //           width: 100,
        //           height: 100,
        //         );
        //       }),
        // )
        Column(
          children: [
            InkWell(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width * 97.25 / 100,
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(width: .5, color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.teal[100],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Image.asset(
                        "assets/model1.JPEG",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width *
                                    12 /
                                    100),
                            child: Text(
                              modelTitle1,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width *
                                    21 /
                                    100,
                                top: 5.0,
                                bottom: 8.0),
                            child: Text(
                              modelTitle1A,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          24 /
                                          100),
                                  child: Text(modelTitleTime)),
                              Container(
                                  margin: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          2 /
                                          100),
                                  child: Icon(Icons.share)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NewWindow(),
                ));
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1),
                )
              ]),
              height: .5,
            ),
            InkWell(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width * 97.25 / 100,
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(width: .5, color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.teal[100],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Image.asset(
                        "assets/model2.JPEG",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width *
                                    12 /
                                    100),
                            child: Text(
                              modelTitle1,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width *
                                    21 /
                                    100,
                                top: 5.0,
                                bottom: 8.0),
                            child: Text(
                              modelTitle1A,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          24 /
                                          100),
                                  child: Text(modelTitleTime)),
                              Container(
                                  margin: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          2 /
                                          100),
                                  child: Icon(Icons.share)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ],

          //main scrollable body
        )
      ],
    );
  }
}

// class FireStorageService extends ChangeNotifier {
//   FireStorageService();
//   static Future<dynamic> loadImage(BuildContext context, String Image) async {
//     return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
//   }
// }

// rules_version = '2';
// service firebase.storage {
//   match /b/{bucket}/o {
//     match /{allPaths=**} {
//       allow read, write;
//     }
//   }
// }
class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final phoneController1 = TextEditingController();
  final nameController = TextEditingController();
  //image picker starts here
  // final ImagePicker _picker = ImagePicker();
  bool circular = false;
  // PickedFile _imageFile;

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 20.0,
          //backgroundImage: _imageFile == null
          //  ? AssetImage("assets/user.JPEG")
          // : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                // takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                // takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.getImage(
  //     source: source,
  //   );
  //   setState(() {
  //     _imageFile = pickedFile;
  //   });
  // }

  Widget bottomSheet1() {
    return Container(
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 85 / 100,
            height: 51,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              style: TextStyle(fontSize: phonenum),
              controller: nameController,
              decoration: InputDecoration(
                hintText: " Full Name",
                contentPadding: EdgeInsets.only(left: 10),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 85 / 100,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 51,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        '+91',
                        style:
                            TextStyle(fontSize: phonenum, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 51,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      style: TextStyle(fontSize: phonenum),
                      controller: phoneController1,
                      decoration: InputDecoration(
                        hintText: "     Phone Number",
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  flex: 6,
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Update"))
              ],
            ),
          ),
        ],
      ),
    );
  }

  //image picker ends here

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Container(
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // CircleAvatar(
                //   backgroundColor: Colors.green,
                // ),
                imageProfile(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bribin Mathew Philip"),
                    Text('+91980987987'),

                    // Row(
                    //   children: [Text("Edit")],
                    // )
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet1()),
                          );
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ],
            )),
          )),
          Container(
              height: 60,
              margin: EdgeInsets.only(left: 7, right: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue[600],
              ),
              child: Row(
                children: [
                  Transform.scale(
                    scale: .45,
                    child: Image.asset('assets/rocket.JPEG'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Become a Pro Member",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text(
                        "Get Access to Advanced Features",
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      )
                    ],
                  )
                ],
              )),
          InkWell(
              child: Container(
                  margin: EdgeInsets.only(left: 7, right: 7, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: .85,
                        child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/bookmark.svg',
                            ),
                            color: Colors.grey[200],
                            onPressed: null //do something,
                            ),
                      ),
                      Text(
                        "My Bookmarks",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ))),
          InkWell(
              child: Container(
                  margin: EdgeInsets.only(left: 7, right: 7, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: .85,
                        child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/notebook-of-contacts.svg',
                            ),
                            color: Colors.grey[200],
                            onPressed: null //do something,
                            ),
                      ),
                      Text(
                        "GST Directory",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Container(
                        height: 26,
                        width: 32,
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(
                          "NEW",
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        )),
                      )
                    ],
                  ))),
          InkWell(
              child: Container(
                  margin: EdgeInsets.only(left: 7, right: 7, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: .85,
                        child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/note.svg',
                            ),
                            color: Colors.grey[200],
                            onPressed: null //do something,
                            ),
                      ),
                      Text(
                        "About gstcentral",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ))),
          InkWell(
              child: Container(
                  margin: EdgeInsets.only(left: 7, right: 7, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: .85,
                        child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/insurance.svg',
                            ),
                            color: Colors.grey[200],
                            onPressed: null //do something,
                            ),
                      ),
                      Text(
                        "Privacy Policy",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ))),
          InkWell(
              child: Container(
                  margin: EdgeInsets.only(left: 7, right: 7, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: .85,
                        child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/mail.svg',
                            ),
                            color: Colors.grey[200],
                            onPressed: null //do something,
                            ),
                      ),
                      Text(
                        "Contact Support",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ))),
          InkWell(
              child: Container(
                  margin: EdgeInsets.only(left: 7, right: 7, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: .85,
                        child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/video-camera.svg',
                            ),
                            color: Colors.grey[200],
                            onPressed: null //do something,
                            ),
                      ),
                      Text(
                        "Tutorials",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ))),
          InkWell(
              child: Container(
                  margin: EdgeInsets.only(left: 7, right: 7, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: .85,
                        child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/share.svg',
                            ),
                            color: Colors.grey[200],
                            onPressed: () {
                              // FlutterShare.share(
                              //     title: 'hello',
                              //     text: 'hi',
                              //     // linkUrl:
                              //     //     'https://play.google.com/store/apps/details?id=com.fishmy.android',
                              //     chooserTitle: 'Share DailyBread Application');
                            } //do something,
                            ),
                      ),
                      Text(
                        "Share with friends",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ))),
          InkWell(
            child: Container(
                margin: EdgeInsets.only(left: 7, right: 7, top: 5, bottom: 5),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: .85,
                      child: IconButton(
                          icon: SvgPicture.asset(
                            'assets/exit.svg',
                          ),
                          color: Colors.grey[200],
                          onPressed: null //do something,
                          ),
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            onTap: () async {
              await _firebaseAuth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => PhoneLogin()));
            },
          ),
        ],
      ),
    ));
  }
}

class NewWindow extends StatefulWidget {
  @override
  _NewWindowState createState() => _NewWindowState();
}

class _NewWindowState extends State<NewWindow> {
  final search = TextEditingController();
  int change = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Transform.scale(
          scale: .70,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 25,
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            }, //do something,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Transform.scale(
            scale: .85,
            child: IconButton(
                icon: SvgPicture.asset(
                  'assets/lens.svg',
                ),
                color: Colors.grey[200],
                onPressed: () {
                  setState(() {
                    if (change == 1) {
                      change = 0;
                    } else if (change == 0) {
                      change = 1;
                    }
                  });
                } //do something,
                ),
          ),
        ],
        title: change == 1
            ? Transform.scale(
                scale: .44,
                child: Image.asset('assets/title.JPEG'),
              )
            : Container(
                height: 51,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  style: TextStyle(fontSize: phonenum),
                  controller: search,
                  decoration: InputDecoration(
                    hintText: "   Search",
                    contentPadding: EdgeInsets.only(left: 10),
                    border: InputBorder.none,
                  ),
                ),
              ),
        centerTitle: true,
      ),
      body: Container(
          child: Column(children: [
        InkWell(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 97.25 / 100,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(width: .5, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.teal[100],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Image.asset(
                    "assets/model1.JPEG",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            right:
                                MediaQuery.of(context).size.width * 12 / 100),
                        child: Text(
                          modelTitle1,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 21 / 100,
                            top: 5.0,
                            bottom: 8.0),
                        child: Text(
                          modelTitle1A,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width *
                                      24 /
                                      100),
                              child: Text(modelTitleTime)),
                          Container(
                              margin: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width *
                                      2 /
                                      100),
                              child: Icon(Icons.share)),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
        Container(
          margin: EdgeInsets.all(30),
          height: 60,
          child: Center(
            child: Text("Dummy data"),
          ),
        )
      ])),
    );
  }
}
