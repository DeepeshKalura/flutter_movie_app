import 'package:flutter/material.dart';

import '../../../../controller/movie_api.dart';
import '../../../../model/cast_model.dart';
import '../../../../model/movie.dart';
import '../../movie/movie_screen.dart';

class DummyMovieCard extends StatefulWidget {
  const DummyMovieCard({super.key, required this.movie});
  final Movie movie;

  @override
  State<DummyMovieCard> createState() => _DummyMovieCardState();
}

class _DummyMovieCardState extends State<DummyMovieCard> {
  List<Cast> castOfMovie = [];
  var isFetchingCast = false;
  late int movieId;
  @override
  void initState() {
    super.initState();
    movieId = widget.movie.id;
    fetchCast();
  }

  @override
  Widget build(BuildContext context) {
    final posterUrl =
        'http://image.tmdb.org/t/p/w500${widget.movie.posterPath}';
    return isFetchingCast == false
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : InkWell(
            onTap: () => navigateDetailPage(context, widget.movie),
            onDoubleTap: () => print('Double Tap'),
            onLongPress: () => print('Long Press'),
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
                        widget.movie.title,
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
                        widget.movie.releaseDate.toString(),
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
          cast: castOfMovie,
        );
      },
    );
    Navigator.push(context, route);
  }

  Future<void> fetchCast() async {
    final cast = await MovieApi.fetchCast(movieId);
    if (!mounted) return;
    setState(() {
      castOfMovie = cast;
      isFetchingCast = true;
    });
  }
}
