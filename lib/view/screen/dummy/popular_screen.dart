import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../controller/movie_api.dart';
import '../../../model/movie.dart';
import '../helper/favorite_screen.dart';
import '../helper/search_screen.dart';
import '../helper/watchlist.dart';
import 'widgets/dummy_movie_card.dart';

class DummyHomeScreen extends StatefulWidget {
  const DummyHomeScreen({super.key});

  @override
  State<DummyHomeScreen> createState() => _DummyHomeScreenState();
}

class _DummyHomeScreenState extends State<DummyHomeScreen> {
  var isfetchedMovies = false;
  var isSearchMovies = false;
  final movieTitleEditior = TextEditingController();
  List<Movie> popularMovies = [];
  List<Movie> searchMovies = [];
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
    movieTitleEditior.dispose();
  }

  void onPresses(String value) async {
    await search(value);
    if (isSearchMovies == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchScreen(
            movieList: searchMovies,
          ),
        ),
      );
    }
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavoriteScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Watch List'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WatchListScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: TextField(
                        controller: movieTitleEditior,
                        onSubmitted: (value) {
                          onPresses(value);
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 0.85,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: popularMovies.length,
                        itemBuilder: (context, index) =>
                            buildMovieSlider(index),
                      ),
                    ),
                  ],
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

  Future<void> search(String query) async {
    final response = await MovieApi.search(query);
    if (!mounted) return;
    setState(() {
      searchMovies = response;
      isSearchMovies = true;
    });
  }
}
