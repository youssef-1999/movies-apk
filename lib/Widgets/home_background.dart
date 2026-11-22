import 'package:flutter/material.dart';
import 'package:movies/Assets/Colors/app_colors.dart';

class HomeBackground extends StatelessWidget {
  final String image;

  const HomeBackground({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            AppColors.mainBlackColor.withValues(alpha: 0.5),
            BlendMode.darken,
          ),
          image: AssetImage(image),
        ),
      ),
    );
  }
}