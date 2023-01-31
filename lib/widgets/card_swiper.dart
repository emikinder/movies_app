import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class CardSwiperScreen extends StatelessWidget {
  const CardSwiperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.STACK,
          itemWidth: size.height * 0.3,
          itemHeight: size.height * 0.45,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context,'details', arguments: 'movie-instance'), 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                    placeholder: AssetImage('lib/assets/no-image.jpg'),
                    image: NetworkImage('https://via.placeholder.com/300x400'),
                    fit: BoxFit.cover),
              ),
            );
          },
        ));
  }
}
