import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_project/api_const.dart';
import 'package:news_project/model/NewsResponse.dart';
import 'package:news_project/model/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse> getSource(String category) async {
    /*
     https://newsapi.org/v2/top-headlines/sources?apiKey=9b4f72c465d74e978fd5434f9d752721
     */
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceApi,
        {'apiKey': '9b4f72c465d74e978fd5434f9d752721', 'category': category});
    try {
//authority is the server name
      //unecode api name
      //parameters apikey
      var response = await http.get(url);
      var bodyString = response.body; //string
      var json = jsonDecode(bodyString); //json
      return SourceResponse.fromJson(
          json); //sent to source response to give us object from the response to use it everywhere
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    /*
     https://newsapi.org/v2/everything?apiKey=9b4f72c465d74e978fd5434f9d752721
     */
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'apiKey': '9b4f72c465d74e978fd5434f9d752721',
      'sources': sourceId,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      print(e);
      throw e;
    }
  }
  static Future<NewsResponse> getNewsByQuery(String q) async {
    /*
     https://newsapi.org/v2/everything?apiKey=9b4f72c465d74e978fd5434f9d752721
     */
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'apiKey': '9b4f72c465d74e978fd5434f9d752721',
      'q':q
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
