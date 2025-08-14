import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:quiz_app/src/constants/colors.dart';
import 'package:quiz_app/src/view/Home/leaderboardscreen.dart';

class TrophyButton extends StatefulWidget {
  const TrophyButton({super.key});

  @override
  State<TrophyButton> createState() => _TrophyButtonState();
}

class _TrophyButtonState extends State<TrophyButton> {
  void _celebrate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LeaderboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        FloatingActionButton(
          onPressed: _celebrate,
          backgroundColor: AppColors.easy,
          child: const Icon(Icons.emoji_events, color: Colors.white),
        ),
      ],
    );
  }
}
