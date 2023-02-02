import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.movie_creation_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [CardSwiperScreen(), MovieSliderScreen()],
          ),
        ));
  }
}
