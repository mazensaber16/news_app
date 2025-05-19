import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../model/NewsResponse.dart';
import '../model/SourceResponse.dart';
import 'api_constatnts.dart';
import 'end_points.dart';

@singleton
class ApiManger {
  //
  // static ApiManger? instance ;   // null , object
  //
  // //todo: private constructor
  // ApiManger._();
  //
  // static ApiManger getInstance(){
  //   instance ??= ApiManger._();
  //   return instance! ;
  // }
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=500c5a4f9b244f3db92a47f436f1819e
   */
  Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi,
        {'apiKey': ApiConstants.apiKey, 'category': categoryId});
    try {
      var response = await http.get(url);

      // String => json => object
      var responseBody = response.body; // String
      var json = jsonDecode(responseBody); // json
      return SourceResponse.fromJson(json);
      // SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=500c5a4f9b244f3db92a47f436f1819e
   */
  Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi,
        {'apiKey': ApiConstants.apiKey, 'sources': sourceId});
    try {
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
