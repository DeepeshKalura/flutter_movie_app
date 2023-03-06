import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/cast_model.dart';
import '../model/movie.dart';
import '../model/movie_details.dart';
import 'api_config.dart';

class MovieApi {
  static Future<List<Movie>> popular() async {
    const path = 'movie/popular';
    final uri = ApiConfing.gerateUrl(path: path);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;
    return results.map((e) => Movie.fromJson(e)).toList();
  }

  static Future<MovieDetails> fetchMovie(int id) async {
    final path = 'movie/$id';
    final uri = ApiConfing.gerateUrl(path: path);
    final response = await http.get(uri);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return MovieDetails.fromJson(json);
  }

  static Future<List<Cast>> fetchCast(int id) async {
    final path = 'movie/$id/credits';
    final uri = ApiConfing.gerateUrl(path: path);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final results = json['cast'] as List<dynamic>;
    return results.map((e) => Cast.fromJson(e)).toList();
  }

  static Future<List<Movie>> recommendations(int id) async {
    final path = '/movie/$id/recommendations';
    final uri = ApiConfing.gerateUrl(path: path);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;
    return results.map((e) => Movie.fromJson(e)).toList();
  }

  static Future<List<Movie>> search(String query) async {
    const path = '/search/movie';
    final uri = ApiConfing.gerateUrl(path: path, query: query);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode != 200) {
      return [];
    }
    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;

    return results.map((e) => Movie.fromJson(e)).toList();
  }
}
