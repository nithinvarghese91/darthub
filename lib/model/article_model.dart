//Now let's create the article model
// for that we just need to copy the property from the json structure
// and make a dart object

import 'source_model.dart';

// class Article {
//   Source source;
//   String author;
//   String title;
//   String description;
//   String url;
//   String urlToImage;
//   String publishedAt;
//   String content;

//   //Now let's create the constructor
//   Article(
//       {this.source,
//       this.author,
//       this.title,
//       this.description,
//       this.url,
//       this.urlToImage,
//       this.publishedAt,
//       this.content});

//   //And now let's create the function that will map the json into a list
//   factory Article.fromJson(Map<String, dynamic> json) {
//     return Article(
//       source: Source.fromJson(json['source']),
//       author: json['author'] as String,
//       title: json['title'] as String,
//       description: json['description'] as String,
//       url: json['url'] as String,
//       urlToImage: json['urlToImage'] as String,
//       publishedAt: json['publishedAt'] as String,
//       content: json['content'] as String,
//     );
//   }
// }

//new gstCentral
import 'dart:convert';

class Autogenerated {
  String status;
  String totalResults;
  Null totalEnglish;
  List<Articles> articles;

  Autogenerated(
      {this.status, this.totalResults, this.totalEnglish, this.articles});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    totalEnglish = json['totalEnglish'];
    if (json['articles'] != null) {
      articles = new List<Articles>();
      json['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    data['totalEnglish'] = this.totalEnglish;
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  int id;
  String url;
  Language language;
  String title;
  String slug;
  String content;
  String description;
  String publishedAt;
  String featuredImage;
  Category category;

  Articles(
      {this.id,
      this.url,
      this.language,
      this.title,
      this.slug,
      this.content,
      this.description,
      this.publishedAt,
      this.featuredImage,
      this.category});

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    title = json['title'];
    slug = json['slug'];
    content = json['content'];
    description = json['description'];
    publishedAt = json['published_at'];
    featuredImage = json['featured_image'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['content'] = this.content;
    data['description'] = this.description;
    data['published_at'] = this.publishedAt;
    data['featured_image'] = this.featuredImage;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }
}

class Language {
  String languageCode;
  String locale;
  bool textDirection;
  String displayName;
  String nativeName;
  bool differentLanguage;

  Language(
      {this.languageCode,
      this.locale,
      this.textDirection,
      this.displayName,
      this.nativeName,
      this.differentLanguage});

  Language.fromJson(Map<String, dynamic> json) {
    languageCode = json['language_code'];
    locale = json['locale'];
    textDirection = json['text_direction'];
    displayName = json['display_name'];
    nativeName = json['native_name'];
    differentLanguage = json['different_language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language_code'] = this.languageCode;
    data['locale'] = this.locale;
    data['text_direction'] = this.textDirection;
    data['display_name'] = this.displayName;
    data['native_name'] = this.nativeName;
    data['different_language'] = this.differentLanguage;
    return data;
  }
}

class Category {
  int id;
  String name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
// newly found api ends here