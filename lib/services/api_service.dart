import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:welcome/model/article_model.dart';
import 'package:http/http.dart';
import 'package:welcome/screens/noInternet.dart';

//Now let's make the HTTP request services
// this class will alows us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  //let's add an Endpoint URL, you can check the website documentation
  // and learn about the different Endpoint
  //for this example I'm going to use a single endpoint

  //NOTE: make sure to use your OWN apikey, you can make a free acount and
  // choose a developer option it's FREE
  final endPointUrl =
      // //"http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=74c1622f901d475aa93e0a8e0dd7ebcf";
      'https://gstcentral.com/wp-json/api/v1/posts';
  //Now let's create the http request function
  // but first let's import the http package

  // Future<List<Article>> getArticle() async {
  Future<List<Articles>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list

      List<Articles> articles =
          body.map((dynamic item) => Articles.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
