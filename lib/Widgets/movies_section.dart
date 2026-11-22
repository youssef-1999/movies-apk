import 'package:flutter/material.dart';
import 'package:movies/Assets/Colors/app_colors.dart';
import 'package:movies/Preferals/movie_card.dart';
import 'package:movies/Preferals/movies.dart';

class MoviesSection extends StatelessWidget {
  final String title;
  final List<Movie> movies;

  const MoviesSection({super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(color: AppColors.wihteColor, fontSize: 20),
              ),
              Text(
                'See More >',
                style: TextStyle(color: AppColors.yellowColor, fontSize: 14),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.28,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: movies.length,
            itemBuilder: (context, itemIndex) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SizedBox(
                  width: size.width * 0.38,
                  child: MovieCard(movie: movies[itemIndex]),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}