import 'package:flutter/material.dart';

import '../../widget/movie_card.dart';
import 'package:flutter_movie_app/controller/fiebase_controller.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final FirebaseController firebaseController = FirebaseController();
  var isShowing = false;
  @override
  initState() {
    super.initState();
    getfetchFavoriteList();
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
                title: const Text('Favorite Movies'),
              ),
              body: ListView.builder(
                itemCount: firebaseController.movies.length,
                itemBuilder: (context, index) {
                  final movie = firebaseController.movies[index];
                  return MovieCard(
                    movie: movie,
                    cast: const [],
                  );
                },
              ),
            ),
          );
  }

  Future<void> getfetchFavoriteList() async {
    String res = await firebaseController.getFavorite();
    print(res);
    setState(() {
      isShowing = true;
    });
  }
}
