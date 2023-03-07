import 'package:flutter/material.dart';

import '../../../../model/dummy_movie.dart';
import '../../../widget/flight_shuttle.dart';
import '../../../widget/top_section.dart';

class DummyMovieScreen extends StatefulWidget {
  final DummyMovie movie;

  const DummyMovieScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<DummyMovieScreen> createState() => _DummyMovieScreenState();
}

class _DummyMovieScreenState extends State<DummyMovieScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final posterUrl =
        'http://image.tmdb.org/t/p/w500${widget.movie.poster_path}';
    final backdropUrl =
        'http://image.tmdb.org/t/p/w500${widget.movie.backdrop_path}';
    final title = widget.movie.title;
    final description = widget.movie.overview;
    final movieId = widget.movie.id;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: ListView(
        children: [
          TopSection(
            backdropUrl: backdropUrl,
            posterUrl: posterUrl,
            title: title,
            id: movieId,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: 'description-$movieId',
              flightShuttleBuilder: flightShuttleBuilder,
              child: Text(
                description,
                style: const TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
