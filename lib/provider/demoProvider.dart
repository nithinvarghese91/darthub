import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/scheduler.dart'; //theme provider property
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system; //theme provider property
  int contColor = 1;
  int circle = 0;
  Connectivity _connectivity = new Connectivity(); //no internet
  bool _isOnline;
  bool get isOnline => _isOnline;
  var intID = 0;
  void netConnection() {
    intID = 1;
  }
  startMonitoring() async {
    await initConnecticity();
    _connectivity.onConnectivityChanged.listen((result) async {
      if (result == ConnectivityResult.none) {
        _isOnline = false;
        notifyListeners();
      } else {
        await _updateConnectionStatus().then((bool isConnected)  {
          _isOnline = isConnected;
          notifyListeners();

        }
        );
      }
    });
  }

  Future<void> initConnecticity() async {
    try {
      var status = await _connectivity.checkConnectivity();
      if (status == ConnectivityResult.none) {
        _isOnline = false;
        notifyListeners();
      } else {
        _isOnline = true;
        notifyListeners();
      }
    } on PlatformException catch (e) {
      print('PlatformException :' + e.toString());
    }
  }

  Future<bool> _updateConnectionStatus() async {
    bool isConnected;
    try {
      final List<InternetAddress> result =
      await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
    }
    return isConnected;
  } //connectivity ends


  String mobnumber = "hey";
  String language  = "English";

  void tabIndicator1() {
    contColor = 1;
    notifyListeners();
  }

  void tabIndicator2() {
    contColor = 0;
    notifyListeners();
  }

  void circleColorChanger() {
    circle = 1;
    notifyListeners();
  }

  void changeValue(String val) {
    mobnumber = val;
    notifyListeners();
  }
  void changeLanguage(String val) {
    language = val;
    notifyListeners();
  }

  Widget circularIndicator() {
    return Center(
        child: circle == 0
            ? CircularProgressIndicator(
                color: Colors.amber,
              )
            : CircularProgressIndicator(
                color: Colors.transparent,
              ));
  }

  Widget tabColor1() {
    print('provider');
    //  padding: EdgeInsets.only(bottom: 25, left: 44),
    return Container(
      height: 4,
      width: 65,
      decoration: BoxDecoration(
          color: contColor == 1 ? Colors.teal : Colors.transparent,
          borderRadius: BorderRadius.circular(40)),
    );
  }

  Widget tabColor2() {
    print('provider');
    //  padding: EdgeInsets.only(bottom: 25, left: 44),
    return Container(
      height: 4,
      width: 52,
      decoration: BoxDecoration(
          color: contColor == 1 ? Colors.transparent : Colors.teal,
          borderRadius: BorderRadius.circular(40)),
    );
  }
//theme provider property

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    // backgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.red
            // Color(0xFFFF323C45)
            ),
        bodyText2: TextStyle(color: Color(0xFFFF323C45))),
    primaryColor: Colors.white,
    //backgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.white, opacity: 0.8),
  );
}
