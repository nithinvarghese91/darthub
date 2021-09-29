import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      //  color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    child: Transform.scale(
                      scale: 1,
                      child: Icon(Icons.wifi),
                    ))
              ],
            ),
            Row(
              children: [
                Text("Can't connect to Internet"),
              ],
            ),
            Row(
              children: [
                Text("Check your network and try again"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
