import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class DemoProvider with ChangeNotifier {
  int contColor = 1;

  void tabIndicator1() {
    contColor = 1;
    notifyListeners();
  }

  void tabIndicator2() {
    contColor = 0;
    notifyListeners();
  }

  Widget tabColor1() {
    print('provider');
    //  padding: EdgeInsets.only(bottom: 25, left: 44),
    return Container(
      height: 4,
      width: 65,
      decoration: BoxDecoration(
          color: contColor == 1 ? Colors.teal : Colors.white,
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
          color: contColor == 1 ? Colors.white : Colors.teal,
          borderRadius: BorderRadius.circular(40)),
    );
  }
}
