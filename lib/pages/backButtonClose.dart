// @dart=2.9

import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:welcome/provider/demoProvider.dart';
import 'package:welcome/screens/newsScreen.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:welcome/screens/noInternet.dart';


//Double tap to exit the app

//Double tap to exit the app
class OutsideDoor extends StatefulWidget {
  @override
  _BackButtonState createState() => _BackButtonState();
}

class _BackButtonState extends State<OutsideDoor> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User user;
  DateTime backbuttonpressedTime;
  int trigger;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    Provider.of<DemoProvider>(context, listen: false).startMonitoring();
    Provider.of<DemoProvider>(context, listen: false)
        .changeValue(user.phoneNumber);
  }

  void getCurrentUser() async {
    User _user = _firebaseAuth.currentUser;
    setState(() {
      user = _user;
    });
  }

  Exit() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2.0))),
            title: Text("Do you want to exit ?"),
            // content: Text("Please upload the image"),

            actions: <Widget>[
              Container(
                height: 30,
                // padding: EdgeInsets.only(bottom: 2),
                child: TextButton(
                  child: Text(
                    "Yes",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    trigger = 1;
                    exit(0);
                  },
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                height: 30,
                // padding: EdgeInsets.only(bottom: 2),
                child: TextButton(
                  child: Text(
                    "No",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    trigger = 0;
                    Navigator.pop(context);
                  },
                ),
              ),
              // SizedBox(
              //   width: 2,
              // ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Color(0xff0398FC),
      body: WillPopScope(
          onWillPop: onWillPop, //here
          child:  Consumer<DemoProvider>(

        builder: (context, model,child)
    {
      return model.isOnline != null ? HomePage(
        user: user,
      ):NoInternet();


  })
          //here
          ),
    );
  }

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();

    //bifbackbuttonhasnotbeenpreedOrToasthasbeenclosed
    //Statement 1 Or statement2
    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);

    if (backButton) {
      backbuttonpressedTime = currentTime;
      // Fluttertoast.showToast(
      //     msg: "Double Click to exit app",
      //     backgroundColor: Colors.black,
      //     textColor: Colors.white);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.amber,
        content: Text(
          'Press back button again to exit',
          style: TextStyle(color: Colors.black),
        ),
      ));
      // return false;
      return Future.value(false);
    }
    //return true;
    return Future.value(true);
  }
}
