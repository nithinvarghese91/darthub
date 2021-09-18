import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:welcome/pages/articles_details_page.dart';
import 'package:welcome/screens/drawerScreen.dart';
import 'package:welcome/widgets/widgets.dart';

class Glance extends StatelessWidget {
//  const Glance({Key? key}) : super(key: key);
  List<String> images = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMainPage(context),
      drawer: DrawerScreen(),
      body: Container(
        child: Swiper(
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            print('index');
            return FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString("assets/data.json"),
                builder: (context, snapshot) {
                  var myData = json.decode(snapshot.data.toString());
                  return
                      //Text(images[index]);
                      Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 8, right: 6.5),
                          decoration: BoxDecoration(

                              //boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.withOpacity(.40), //color of shadow
                              //     spreadRadius: 1, //spread radius
                              //     blurRadius: 0.10, // blur radius
                              //     // offset: Offset(1, 1)
                              //   )
                              // ]
                              ),
                          child: Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height * .38,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                              top: 12,
                              left: 12,
                              right: 12,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .26,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    //let's add the height

                                    image: DecorationImage(
                                        image: AssetImage(
                                            // article.urlToImage
                                            myData[images[index]]['imageName']),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                // SizedBox(
                                //   height: 18,
                                // ),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(myData[images[index]]['title'],
                                    style: TextStyle(
                                        color: Color(0xFFFF323C45),
                                        fontSize: 16,
                                        fontFamily: 'inter',
                                        fontWeight: FontWeight.w600)),

                                Spacer(
                                  flex: 1,
                                ),
                                Row(
                                  children: [
                                    //  Text(DateFormat('MMM d, yyyy').format(DateTime.parse(article.publishedAt)).toString()),
                                    Text(myData[images[index]]['date'],
                                        style: TextStyle(
                                          color: Color(0xFFFF939393),
                                          fontSize: 10,
                                          fontFamily: 'inter',
                                        )),
                                    Spacer(
                                      flex: 5,
                                    ),
                                    Text("0 comments",
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 12,
                                        )),
                                    // Spacer(
                                    //   flex: 3,
                                    // ),
                                  ],
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Text(
                            myData[images[index]]['content'],
                            style: TextStyle(
                                color: Color(0xffff323C45),
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                height: 1.5,
                                fontFamily: 'Inria'),
                          ),
                        )
                      ],
                    ),
                  );
                });
            //  Container(
            //     height: double.infinity,
            //     width: double.infinity,
            //     color: Colors.amber,
            //     child: Center(
            //         child: Text(
            //       images[index],
            //       style: TextStyle(fontSize: 22),
            //     )));
          },
          scrollDirection: Axis.vertical,
        ),
      ),
      bottomNavigationBar: bottomNavigation(context),
    );
  }
}
