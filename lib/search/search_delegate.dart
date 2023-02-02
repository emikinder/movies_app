import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Search movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResult');
  }

  Widget _emptyContainer() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.movie_creation, color: Colors.black, size: 40),
            Text('Write something to search'),
          ],
        ),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }

    print('http request');

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.searchMovie(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if(!snapshot.hasData) return _emptyContainer();

        final movies = snapshot.data!;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_, int index) => _MovieItem(movies[index]),
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  const _MovieItem(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'search-${movie.id}';
    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('lib/assets/no-image.jpg'),
          image: NetworkImage(movie.fullPosterImg),
          fit: BoxFit.cover
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}


