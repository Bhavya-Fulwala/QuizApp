import 'package:flutter/material.dart';
import 'package:quiz_app/src/constants/colors.dart';
import 'widgets/home_header.dart';
import 'widgets/home_stats.dart';
import 'widgets/category_grid.dart';
import 'widgets/trophy_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: true,
      left: false,
      right: false,
      child:Scaffold(
      backgroundColor: AppColors.backgroundLight,
      floatingActionButton: const TrophyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HomeHeader(),
                SizedBox(height: 20),
                HomeStats(),
                SizedBox(height: 20),
                CategoryGrid(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
