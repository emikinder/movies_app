import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

import '../models/models.dart';

class CardSwiperScreen extends StatelessWidget {
  const CardSwiperScreen({Key? key, required this.movies}) : super(key: key);
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.height * 0.3,
          itemHeight: size.height * 0.45,
          itemBuilder: (_, int index) {
            final movie = movies[index];
            movie.heroId = 'swiper-${movie.id}';
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: movie),
              child: Hero(
                tag: movie.heroId!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                      placeholder: const AssetImage('lib/assets/no-image.jpg'),
                      image: NetworkImage(movie.fullPosterImg),
                      fit: BoxFit.cover),
                ),
              ),
            );
          },
        ));
  }
}
