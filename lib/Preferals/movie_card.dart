import 'package:flutter/material.dart';
import 'package:movies/Assets/Colors/app_colors.dart';
import 'package:movies/Preferals/movies.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // poster
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(movie.image, fit: BoxFit.cover),
        ),
        // rating badge, top left
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.secondryGrayColor.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${movie.rating}',
                  style: TextStyle(color: AppColors.wihteColor, fontSize: 14),
                ),
                const SizedBox(width: 4),
                Icon(Icons.star, color: AppColors.yellowColor, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}