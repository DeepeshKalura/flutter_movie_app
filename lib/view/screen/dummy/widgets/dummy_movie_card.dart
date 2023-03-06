import 'package:flutter/material.dart';

import '../../../../model/cast_model.dart';
import '../../../../model/movie.dart';
import '../../movie/movie_screen.dart';

class DummyMovieCard extends StatelessWidget {
  const DummyMovieCard({super.key, required this.movie, required this.cast});
  final Movie movie;
  final List<Cast> cast;

  @override
  Widget build(BuildContext context) {
    final posterUrl = 'http://image.tmdb.org/t/p/w500${movie.posterPath}';
    final movieId = movie.id;
    return InkWell(
      onTap: () => navigateDetailPage(context, movie),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: 'poster-$movieId',
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage(
                        posterUrl,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Hero(
                tag: 'title-$movieId',
                child: Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.date_range,
                  fill: 1,
                  color: Colors.black,
                ),
                Text(
                  movie.releaseDate.toString(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void navigateDetailPage(BuildContext context, Movie movie) {
    final route = MaterialPageRoute(
      builder: (context) {
        return MovieScreen(
          movie: movie,
          cast: cast,
        );
      },
    );
    Navigator.push(context, route);
  }
}
