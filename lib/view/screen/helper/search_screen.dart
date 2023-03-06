import 'package:flutter/material.dart';

import '../../../model/movie.dart';
import '../../widget/movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.movieList});
  final List<Movie> movieList;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.movieList.length,
      itemBuilder: (context, index) {
        final movie = widget.movieList[index];
        return MovieCard(
          movie: movie,
          cast: const [],
        );
      },
    );
  }
}
