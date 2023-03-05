import 'package:flutter/material.dart';

import 'tabs/movie_tabs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Discover'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Movie'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MovieTab(),
          ],
        ),
      ),
    );
  }
}
