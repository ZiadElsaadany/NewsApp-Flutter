import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model/SourcesResponces.dart';
import 'package:news/model/news_response/NewsResponse.dart';
class ApiManager {

  static const String BaseUrl = 'newsapi.org' ;
 static Future<SourcesResponces> getSources (
     String categoryId
     ) async{
    // call api to get news sources
//https://newsapi.org/v2/top-headlines/sources?apiKey=9273e8c3654242b380ed9fdbba8f8254
     var url = Uri.https(
       BaseUrl,
       '/v2/top-headlines/sources',
       {
         'apikey':  '9273e8c3654242b380ed9fdbba8f8254',
         'category':categoryId,

       }
     ) ;
     var response = await http.get(url) ;

     try{
    var bodyString = response.body;  // convert it to json

    var json = jsonDecode(bodyString);

    var sourcesResponse= SourcesResponces.fromJson(json) ;

    return sourcesResponse;

     }catch(e){
       throw e;

     }
  }
  static Future<NewsResponse> getNews(
  {
    String?  sourceId,String ?searchKeyWord , int ? page=1
}) async {

    var url = Uri.https(
        BaseUrl,
        '/v2/everything',
        {
          'apikey':  '9273e8c3654242b380ed9fdbba8f8254',
          'sources':sourceId,
          'q': searchKeyWord,
        'page' : '$page'

        }
    ) ;
    var response = await http.get(url) ;
    try{
      var bodyString = response.body;  // convert it to json

      var json = jsonDecode(bodyString);

      var newsResponse = NewsResponse.fromJson(json);

      return newsResponse;
    }catch(e){
      throw e;

    }
  }
}