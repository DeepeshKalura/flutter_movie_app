import 'package:flutter/material.dart';

import 'package:flutter_movie_app/controller/fiebase_controller.dart';

import 'widget/dummy_movie_card.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({
    super.key,
  });

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  final FirebaseController firebaseController = FirebaseController();
  var isShowing = false;
  @override
  initState() {
    super.initState();
    getfetchWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return isShowing == false
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Watchlist'),
              ),
              body: ListView.builder(
                itemCount: firebaseController.movies.length,
                itemBuilder: (context, index) {
                  final movie = firebaseController.movies[index];
                  return DummiestMovieCard(
                    movie: movie,
                  );
                },
              ),
            ),
          );
  }

  Future<void> getfetchWatchList() async {
    String res = await firebaseController.getWatchlist();
    print(res);
    setState(() {
      isShowing = true;
    });
  }
}
