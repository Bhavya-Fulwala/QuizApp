import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app/src/constants/colors.dart';
import 'package:quiz_app/src/service/local_storage_service.dart';

class HomeStats extends StatefulWidget {
  const HomeStats({super.key});

  @override
  State<HomeStats> createState() => _HomeStatsState();
}

class _HomeStatsState extends State<HomeStats> {
  int totalScore = 0;
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    _loadTotalScore();
  }

  Future<void> _loadTotalScore() async {
    final summaries = await QuizSummaryStorage().loadSummaries();

    int totalCorrect = summaries.fold(
      0,
      (previousValue, element) => previousValue + element.correctAnswers,
    );

    int totalQuestions = summaries.fold(
      0,
      (previousValue, element) => previousValue + element.totalQuestions,
    );

    setState(() {
      totalScore = totalCorrect;
      progress = totalQuestions == 0
          ? 0.0
          : (totalCorrect / totalQuestions).clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 40,
            lineWidth: 8,
            percent: progress,
            center: Text("${(progress * 100).toInt()}%"),
            progressColor: Colors.orange.shade300,
            backgroundColor: AppColors.textSecondaryDark,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              "Your total score is $totalScore points.\nKeep going!",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
