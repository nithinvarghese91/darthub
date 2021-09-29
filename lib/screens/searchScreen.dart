import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:welcome/provider/demoProvider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Provider.of<DemoProvider>(context).themeMode ==
            ThemeMode.dark
            ? Colors.grey.shade900
            : Colors.white,
        elevation: 1.5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 7,
            ),
            GestureDetector(
              child: Transform.scale(
                scale: 1,
                child: SvgPicture.asset('assets/svg/arrow.svg',color:Provider.of<DemoProvider>(context).themeMode ==
                    ThemeMode.dark
                    ? Colors.white
                    : null,),
              ),
              onTap: () {
                Navigator.pop(context);
                print('backbutton pressed');
              },
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Search Tags',
              style: TextStyle(
                  fontSize: 14,
                  color:Provider.of<DemoProvider>(context).themeMode ==
                      ThemeMode.dark
                      ? Colors.white
                      :  Colors.grey,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Trending',
                style: TextStyle(
                    fontSize: 13,
                    color: Provider.of<DemoProvider>(context).themeMode ==
                        ThemeMode.dark
                        ? Colors.white
                        :  Colors.grey,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 20,
            ),
            Text('#gst',
                style: TextStyle(
                    fontSize: 14,
                    color: Provider.of<DemoProvider>(context).themeMode ==
                        ThemeMode.dark
                        ? Colors.white
                        :  Colors.grey,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
