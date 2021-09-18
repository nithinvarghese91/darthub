import 'package:flutter/material.dart';
import 'package:welcome/widgets/widgets.dart';
import 'package:welcome/screens/drawerScreen.dart';

class Guides extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  //guides column
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarMainPage(context),
        drawer: DrawerScreen(),
        body: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          children: [MainBody(context), Center(child: Text("guides"))],
        ),
        bottomNavigationBar: bottomNavigation(context),
      ),
    );
  }
}




// ListView.builder(
//               physics: BouncingScrollPhysics(),
//               //Now let's create our custom List tile
//               itemCount: articles.length,
//               itemBuilder: (context, index) {
//                 print(articles.length);
//                 return bodyTileCol(articles[index], context);
//               },
//             );