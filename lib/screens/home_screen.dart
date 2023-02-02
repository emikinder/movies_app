import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/providers/movies_provider.dart';

import '../search/search_delegate.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
                icon: const Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiperScreen(movies: moviesProvider.onDisplayMovies),
              MovieSliderScreen(
                movies: moviesProvider.popularMovies,
                title: 'Most viewed',
                onNextPage: () => moviesProvider.getPopularMovies(),
              )
            ],
          ),
        ));
  }
}
