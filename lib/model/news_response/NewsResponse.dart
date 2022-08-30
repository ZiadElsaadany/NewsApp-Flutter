import 'Articles.dart';

class NewsResponse {
  String?status;
  int ?totalResults;
  List<News> ?articles;
  String ? message;
  String ? code;

  NewsResponse({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message
  });

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    message = json['message'];
    code = json['code'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(News.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}



