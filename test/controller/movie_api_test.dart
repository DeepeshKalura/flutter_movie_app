// Unit Test Code:
import 'package:flutter_movie_app/controller/movie_api.dart';
import 'package:flutter_movie_app/model/cast_model.dart';
import 'package:flutter_movie_app/model/movie.dart';
import 'package:flutter_movie_app/model/movie_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test popular method', () async {
    List<Movie> movies = await MovieApi.popular();

    expect(movies, isNotNull);
    expect(movies[0].title, isNotNull);
  });

  test('Test fetchMovie method', () async {
    MovieDetails movieDetails = await MovieApi.fetchMovie(1);

    expect(movieDetails, isNotNull);
    expect(movieDetails.title, isNotNull);
  });

  test('Test fetchCast method', () async {
    List<Cast> casts = await MovieApi.fetchCast(1);

    expect(casts, isNotNull);
    expect(casts[0].name, isNotNull);
  });

  test('Test recommendations method', () async {
    List<Movie> movies = await MovieApi.recommendations(1);

    expect(movies, isNotNull);
    expect(movies[0].title, isNotNull);
  });

  test('Test search method', () async {
    List<Movie> movies = await MovieApi.search("query");

    expect(movies, isNotNull);
    expect(movies[0].title, isNotNull);
  });
} // end of unit tests for the given code snippet
