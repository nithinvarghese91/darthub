import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:intl/intl.dart';
import 'package:welcome/Handler.dart';

class SplashScreen extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        // ()=>Navigator.push(context,MaterialPageRoute(builder:(context)=>OutsideDoor())));
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => App())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  TimeOfDay _time = TimeOfDay.now();
  DateTime _date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform.scale(
                  scale: .84,
                  child: SvgPicture.asset('assets/svg/Pattern_light 1.svg'),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            Spacer(
              flex: 2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                    scale: 1,
                    child: SvgPicture.asset('assets/svg/Group (1).svg')),
                SizedBox(
                  height: 8,
                ),
                Text(
                  DateFormat('EEEE, d MMM, yyyy').format(_date),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      wordSpacing: 1),
                ),
              ],
            ),
            Spacer(
              flex: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Transform.scale(
                  scale: .841,
                  child: SvgPicture.asset('assets/svg/Pattern_light 1.svg'),
                ),
              ],
            ),
            Spacer(
              flex: 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 1,
                  child:
                      SvgPicture.asset('assets/svg/Made with ❤️ in India..svg'),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "Version v.001 Beta",
                  style: TextStyle(fontSize: 9),
                ),
                SizedBox(
                  height: 5,
                ),
                Transform.scale(
                  scale: .841,
                  child: SvgPicture.asset('assets/svg/Vector.svg'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




//pin decor
