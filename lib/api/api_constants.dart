class ApiConstants {
  static const String baseUrl = 'api.themoviedb.org';
  static const String apiKay = 'fecf6be8bcaf8b29e6d94548a8dedac6';
  /// Api popular
  static const String popularApi = '/3/person/popular';
  /// Api Upcoming
  static const String upComingApi = '/3/movie/upcoming';
  /// Api Top Rated => Recommended
  static const String topRatedApi = '/3/movie/top_rated';
  /// Api Details => Movie Details.
  static const String detailsApi = '/3/movie/{movie_id}';
  /// Api Similar => more like this section.
  static const String similarApi = '/3/movie/{movie_id}/similar';
}