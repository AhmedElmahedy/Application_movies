import 'dart:convert';
import 'package:app_movies/api/api_constants.dart';
import 'package:app_movies/model/ResponsePopularSuccess.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  /*
  https://api.themoviedb.org/3/person/popular
   */
  static Future<ResponsePopularSuccess?> getPopular() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularApi,
        {
          'api_key' : ApiConstants.apiKay
        });
    try{
      var response = await http.get(url);
        var responseBody = response.body;
        var json = jsonDecode(responseBody);
        return ResponsePopularSuccess.fromJson(json);
    }catch (e){
      throw e ;
    }
  }
}