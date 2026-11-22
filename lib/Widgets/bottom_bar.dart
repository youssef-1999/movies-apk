import 'package:flutter/material.dart';
import 'package:movies/Assets/Colors/app_colors.dart';
import 'package:svg_flutter/svg.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  const BottomBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.secondryGrayColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            buildBarItem('lib/Assets/Icons/home.svg'),
            buildBarItem('lib/Assets/Icons/search.svg'),
            buildBarItem('lib/Assets/Icons/compas.svg'),
            buildBarItem('lib/Assets/Icons/profile.svg'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBarItem(String path) {
    return BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(
        path,
        width: 28,
        height: 28,
        colorFilter: ColorFilter.mode(AppColors.wihteColor, BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        path,
        width: 28,
        height: 28,
        colorFilter: ColorFilter.mode(AppColors.yellowColor, BlendMode.srcIn),
      ),
    );
  }
}
