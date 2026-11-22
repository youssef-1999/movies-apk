import 'package:flutter/material.dart';
import 'package:movies/Assets/Colors/app_colors.dart';
import 'package:movies/Preferals/movie_list.dart';
import 'package:movies/Widgets/bottom_bar.dart';
import 'package:movies/Widgets/home_background.dart';
import 'package:movies/Widgets/movies_carousel.dart';
import 'package:movies/Widgets/movies_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final String routeName = '/homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.mainBlackColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainBlackColor,
        title: Image.asset('lib/Assets/Images/Available_Now.png'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.65,
              child: Stack(
                children: [
                  HomeBackground(image: movies[index].image),
                  MoviesCarousel(
                    movies: movies,
                    onPageChanged: (newIndex) {
                      setState(() {
                        index = newIndex;
                      });
                    },
                  ),
                ],
              ),
            ),
            Image.asset('lib/Assets/Images/Watch_Now.png'),
            MoviesSection(title: 'Action', movies: movies),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: selectedTab,
        onTap: (newTab) {
          setState(() {
            selectedTab = newTab;
          });
        },
      ),
    );
  }
}