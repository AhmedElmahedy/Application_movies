import 'dart:convert';

import 'package:app_movies/api/api_constants.dart';
import 'package:app_movies/model/ResponseBrowseDetails.dart';
import 'package:app_movies/model/ResponseDetailsSuccess.dart';
import 'package:app_movies/model/ResponsePopularSuccess.dart';
import 'package:app_movies/model/ResponseRecommendedSuccess.dart';
import 'package:app_movies/model/ResponseSimilarMovies.dart';
import 'package:app_movies/model/ResponseUpcomingSuccess.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  /// https://api.themoviedb.org/3/person/popular
  static Future<ResponsePopularSuccess?> getPopular() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularApi, {
      'api_key': ApiConstants.apiKey,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ResponsePopularSuccess.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  ///  https://api.themoviedb.org/3/movie/upcoming
  static Future<ResponseUpcomingSuccess?> getUpcoming() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.upComingApi,
        {'api_key': ApiConstants.apiKey});
    try {
      var response = await http.get(url);
      return ResponseUpcomingSuccess.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  ///https://api.themoviedb.org/3/movie/top_rated
  static Future<ResponseRecommendedSuccess?> getRecommended() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.topRatedApi,
        {'api_key': ApiConstants.apiKey});
    try {
      var response = await http.get(url);
      return ResponseRecommendedSuccess.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  /// https://api.themoviedb.org/3/movie/{movie_id}
  static Future<ResponseDetailsSuccess?> getDetailsMovies(int movie_id) async {
    Uri url = Uri.https(ApiConstants.baseUrl, '/3/movie/$movie_id',
        {'api_key': ApiConstants.apiKey});
    try {
      var response = await http.get(url);
      return ResponseDetailsSuccess.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  /// https://api.themoviedb.org/3/movie/{movie_id}/similar
  static Future<ResponseSimilarMovies?> getSimilarMovies(int movie_Id) async {
    Uri url = Uri.https(ApiConstants.baseUrl, '/3/movie/$movie_Id/similar',
        {'api_key': ApiConstants.apiKey});
    try {
      var response = await http.get(url);
      return ResponseSimilarMovies.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<ResponseBrowseDetails?> getGenresList(int genre_id) async{
    Uri url = Uri.https(ApiConstants.baseUrl , ApiConstants.BrowseApi,{'api_key': ApiConstants.apiKey});
    try {
      var response = await http.get(url);
      return ResponseBrowseDetails.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }


  }

}
