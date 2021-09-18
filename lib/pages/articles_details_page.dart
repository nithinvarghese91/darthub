//Now let's create the article details page

import 'package:welcome/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ArticlePage extends StatelessWidget {
  // final Article article;
  final Articles article;

  ArticlePage({this.article});

  @override
  Widget build(BuildContext context) {
    var timeDate = DateFormat('MMM d, yyyy')
        .format(DateTime.parse(article.publishedAt))
        .toString();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
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
                  child: SvgPicture.asset('assets/svg/arrow.svg'),
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
                'Latest News & Updates',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          centerTitle: false,
        ),
        body: ListView(
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 6.5),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.25), //color of shadow
                  spreadRadius: .50, //spread radius
                  blurRadius: 0.10, // blur radius
                  // offset: Offset(1, 1)
                )
              ]),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * .38,
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 12,
                  left: 12,
                  right: 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .26,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        //let's add the height

                        image: DecorationImage(
                          image: NetworkImage(
                            // article.urlToImage
                            article.featuredImage,
                          ),
                          fit: BoxFit.fill,
                        ),

                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    // SizedBox(
                    //   height: 18,
                    // ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(article.title,
                        style: TextStyle(
                            color: Color(0xFFFF323C45),
                            fontSize: 16,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w600)),

                    // Spacer(
                    //   flex: 1,
                    // ),
                    // Text("Compensation Shortfall under GST",
                    //     style: TextStyle(
                    //         color: Color(0xFFFF323C45),
                    //         fontSize: 16,
                    //         fontFamily: 'inter',
                    //         fontWeight: FontWeight.w600)),

                    Spacer(
                      flex: 1,
                    ),
                    Row(
                      children: [
                        //  Text(DateFormat('MMM d, yyyy').format(DateTime.parse(article.publishedAt)).toString()),
                        Text("Updated $timeDate     2 Min Read",
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
            // Divider(
            //   height: 1.5,
            // ),
            // SizedBox(
            //   height: 7,
            // ),
            // Divider(
            //   height: 1.5,
            // ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Text(
                article.content,
                style: TextStyle(
                    color: Color(0xffff323C45),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.5,
                    fontFamily: 'Inria'),
              ),
            )
          ],
        ));
  }
}

//new article page

class DetailsScreen extends StatelessWidget {
  final Articles article;

  DetailsScreen({this.article});

  @override
  Widget build(BuildContext context) {
    var timeDate = DateFormat('MMM d, yyyy')
        .format(DateTime.parse(article.publishedAt))
        .toString();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
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
                child: SvgPicture.asset('assets/svg/arrow.svg'),
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
              'Gst News &',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 6.5),
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
                      height: MediaQuery.of(context).size.height * .26,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        //let's add the height

                        image: DecorationImage(image: NetworkImage(
                            // article.urlToImage
                            article.featuredImage), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: article.featuredImage.isEmpty
                          ? CircularProgressIndicator()
                          : null,
                    ),
                    // SizedBox(
                    //   height: 18,
                    // ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(article.title,
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
                        Text("Updated $timeDate     2 Min Read",
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
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Text(
                article.content,
                style: TextStyle(
                    color: Color(0xffff323C45),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.5,
                    fontFamily: 'Inria'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
