import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/cast_model.dart';

import '../../../../controller/movie_api.dart';
import '../../../../model/movie.dart';
import '../../../widget/movie_card.dart';

class MovieTab extends StatefulWidget {
  const MovieTab({Key? key}) : super(key: key);

  @override
  State<MovieTab> createState() => _MovieTabState();
}

class _MovieTabState extends State<MovieTab> {
  List<Movie> discoverMovies = [];
  List<Cast> castOfMovies = [];
  int? movieId;

  @override
  void initState() {
    super.initState();
    fetchMovies();
    fetchCast();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: discoverMovies.length,
      itemBuilder: (context, index) {
        final movie = discoverMovies[index];
        movieId = movie.id;
        final cast = castOfMovies[index];
        return MovieCard(
          movie: movie,
          cast: cast,
        );
      },
    );
  }

  Future<void> fetchMovies() async {
    final response = await MovieApi.popular();
    setState(() {
      discoverMovies = response;
    });
  }

  Future<void> fetchCast() async {
    final cast = await MovieApi.fetchCast(movieId ?? 315162);
    setState(() {
      castOfMovies = cast;
    });
  }
}
