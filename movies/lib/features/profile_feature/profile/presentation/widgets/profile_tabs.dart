import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/features/profile_feature/profile/pfps.dart';


/// Icon-only tabs. Replace the empty-state bodies with real lists later.
class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: const [
          TabBar(
            indicatorColor: AppColors.yellow,
            labelColor: AppColors.yellow,
            unselectedLabelColor: Colors.white,
            dividerColor: Colors.white24,
            tabs: [
              Tab(icon: Icon(Icons.list_rounded, size: 28)),
              Tab(icon: Icon(Icons.folder_rounded, size: 28)),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _EmptyState(), // TODO(logic): wish list movies
                _EmptyState(), // TODO(logic): history movies
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) =>
      Center(child: Image.asset(ProfileAssets.popcorn, width: 120));
}
