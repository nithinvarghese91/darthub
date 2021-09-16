import 'package:flutter_svg/svg.dart';
import 'package:welcome/model/article_model.dart';
import 'package:welcome/pages/articles_details_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget customListTile(
    // Article article,

    Articles article,
    BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: article,
                  )));
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              //let's add the height

              image: DecorationImage(image: NetworkImage(
                  // article.urlToImage
                  article.featuredImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(DateTime.parse(article.publishedAt).toString()),
          SizedBox(
            height: 8.0,
          ),
          Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              )),
          SizedBox(
            height: 8.0,
          ),
          Text(
            // article.source.name,
            article.content,
            overflow: TextOverflow.fade,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
    ),
  );
}

//original columnbody gst central

Widget bodyTileCol(Articles article, BuildContext context) {
  var timeDate = DateFormat('MMM d, yyyy')
      .format(DateTime.parse(article.publishedAt))
      .toString();
  return InkWell(
      onTap: () {
        print('articlepage');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticlePage(
                      article: article,
                    )));
      },
      child: Column(
        children: [
          // SizedBox(
          //   height: 10,
          // ),
          Divider(
            height: 2,
          ),
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

                      image: DecorationImage(image: NetworkImage(
                          // article.urlToImage
                          article.featuredImage), fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(7.0),
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
                      Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Transform.scale(
                            alignment: Alignment.bottomCenter,
                            scale: 1.4,
                            child: SvgPicture.asset(
                              'assets/svg/share.svg',
                              color: Color(0xFFFF323C45),
                            ),
                          ),
                        ],
                      ),
                      Spacer(
                        flex: 3,
                      ),
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
          SizedBox(
            height: 7,
          ),
          // Divider(
          //   height: 1.5,
          // ),
          // Divider(
          //   height: 2,
          // ),
        ],
      ));
}
