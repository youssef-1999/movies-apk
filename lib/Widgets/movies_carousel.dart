import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/Preferals/movie_card.dart';
import 'package:movies/Preferals/movies.dart';

class MoviesCarousel extends StatelessWidget {
  final List<Movie> movies;
  final void Function(int) onPageChanged;

  const MoviesCarousel({
    super.key,
    required this.movies,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: CarouselSlider.builder(
        itemCount: movies.length,
        itemBuilder: (context, itemIndex, realIndex) {
          return MovieCard(movie: movies[itemIndex]);
        },
        options: CarouselOptions(
          height: size.height * 0.45,
          viewportFraction: 0.6,
          enlargeCenterPage: true,
          onPageChanged: (newIndex, reason) {
            onPageChanged(newIndex);
          },
        ),
      ),
    );
  }
}