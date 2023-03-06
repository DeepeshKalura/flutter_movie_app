import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../controller/movie_api.dart';
import '../../../model/movie.dart';
import 'widgets/dummy_movie_card.dart';

class DummyHomeScreen extends StatefulWidget {
  const DummyHomeScreen({super.key});

  @override
  State<DummyHomeScreen> createState() => _DummyHomeScreenState();
}

class _DummyHomeScreenState extends State<DummyHomeScreen> {
  var isfetchedMovies = false;
  List<Movie> popularMovies = [];
  int intialPage = 1;
  PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: intialPage,
      viewportFraction: 0.8,
    );
    fetchMovies();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isfetchedMovies == false
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Home Screen'),
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(
                    child: Text('Movie App'),
                  ),
                  ListTile(
                    title: const Text('Favorite List'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Watch List'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: AspectRatio(
                aspectRatio: 0.85,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: popularMovies.length,
                  itemBuilder: (context, index) => buildMovieSlider(index),
                ),
              ),
            ),
          );
  }

  Widget buildMovieSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 2;
          if (_pageController.position.haveDimensions) {
            value = (index - _pageController.page!);
            value = ((value.abs() * 0.038)).clamp(-1.0, 1.0);
          }
          final movie = popularMovies[index];
          return Center(
            child: SizedBox(
              child: Transform.rotate(
                angle: math.pi * value,
                child: DummyMovieCard(movie: movie),
              ),
            ),
          );
        },
      );
  Future<void> fetchMovies() async {
    final response = await MovieApi.popular();
    if (!mounted) return;
    setState(() {
      popularMovies = response;
      isfetchedMovies = true;
    });
  }
}
