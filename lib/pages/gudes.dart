// // import 'package:flutter/material.dart';
// // import 'package:welcome/widgets/widgets.dart';
// // import 'package:welcome/screens/drawerScreen.dart';
// //
// // class Guides extends StatelessWidget {
// //   // const ({ Key? key }) : super(key: key);
// //
// //   @override
// //   //guides column
// //   Widget build(BuildContext context) {
// // //     return SafeArea(
// // //       child: Scaffold(
// // //        // backgroundColor: Colors.white,
// // //         appBar: appBarMainPage(context),
// // //         drawer: DrawerScreen(),
// // //         body: Column(
// // //           //   mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [MainBody(context), Center(child: Text("guides"))],
// // //         ),
// // //         bottomNavigationBar: bottomNavigation(context),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //     return DefaultTabController(
// //       initialIndex: 1,
// //       length: 2,
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('TabBar Widget'),
// //           bottom: const TabBar(
// //             tabs: <Widget>[
// //               Tab(
// //                 icon: Icon(Icons.cloud_outlined),
// //               ),
// //               Tab(
// //                 icon: Icon(Icons.beach_access_sharp),
// //               ),
// //
// //             ],
// //           ),
// //         ),
// //         body:  TabBarView(
// //           children: <Widget>[
// //             Container(
// //               //padding: EdgeInsets.only(bottom: 5),
// //               child: Column(
// //                 children: [MainBody(context), fetchedData()],
// //               ),
// //             ),
// //             Center(
// //               child: Text("It's rainy here"),
// //             ),
// //             // Center(
// //             //   child: Text("It's sunny here"),
// //             // ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// //new tab testing
//
// import 'dart:math';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: CustomSliverAppbar(),
//     );
//   }
// }
//
//
//
// //
// //
// // class CustomSliverAppbar extends StatefulWidget {
// //   @override
// //   _CustomSliverAppbarState createState() => _CustomSliverAppbarState();
// // }
// //
// // class _CustomSliverAppbarState extends State<CustomSliverAppbar>
// //     with SingleTickerProviderStateMixin {
// //   TabController _tabController;
// //
// //   @override
// //   void initState() {
// //     _tabController = TabController(
// //       initialIndex: 0,
// //       length: 2,
// //       vsync: this,
// //     );
// //     super.initState();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: NestedScrollView(
// //         floatHeaderSlivers: true,
// //         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
// //           return <Widget>[
// //             SliverAppBar(
// //               leading: GestureDetector(onTap:(){
// //                 Navigator.pop(context);
// //               },child: Icon(Icons.arrow_back)),
// //               title: Text(
// //                 "WhatsApp type sliver appbar",
// //               ),
// //               centerTitle: true,
// //               pinned: true,
// //               floating: true,
// //               bottom: TabBar(
// //
// //                   indicatorColor: Colors.black,
// //                   labelPadding: const EdgeInsets.only(
// //                     bottom: 16,
// //                   ),
// //                   controller: _tabController,
// //                   tabs: [
// //                     Container(alignment: Alignment.centerRight,color: Colors.red,child: Text("TAB A",textAlign: TextAlign.right)),
// //                     Text("TAB B"),
// //                   ]),
// //             ),
// //           ];
// //         },
// //         body: TabBarView(
// //           controller: _tabController,
// //           children: [
// //             TabA(),
// //             const Center(
// //               child: Text('Display Tab 2',
// //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }
// // }
// //
// // class TabA extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scrollbar(
// //       child: ListView.separated(
// //         separatorBuilder: (context, child) => Divider(
// //           height: 1,
// //         ),
// //         padding: EdgeInsets.all(0.0),
// //         itemCount: 30,
// //         itemBuilder: (context, i) {
// //           return Container(
// //             height: 100,
// //             width: double.infinity,
// //             color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// /






import 'package:flutter/material.dart';

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true;

  @override
  // void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
  //   final Offset circleOffset =
  //       offset + Offset(cfg.size.width / 2, cfg.size.height - radius - 5);
  //   canvas.drawCircle(circleOffset, radius, _paint);
  // }

  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset ovalOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius - 5);
    canvas.drawCircle(ovalOffset, radius, _paint) ;


  }


}









