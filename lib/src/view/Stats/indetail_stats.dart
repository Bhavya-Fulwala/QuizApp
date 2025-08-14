import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:quiz_app/src/model/quiz_summary.dart';

class QuizSummaryDetailScreen extends StatelessWidget {
  final QuizSummary summary;

  const QuizSummaryDetailScreen({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Summary Detail'),
        backgroundColor: Colors.orange.shade300,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quiz Date: ${summary.date.toLocal()}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Basic stats
            Text(
              'Total Questions: ${summary.totalQuestions}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Correct Answers: ${summary.correctAnswers}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Wrong Answers: ${summary.wrongAnswers}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Longest Streak: ${summary.longestStreak}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Accuracy by Difficulty Pie Chart
            const Text(
              'Accuracy by Difficulty',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 60),
            SizedBox(
              height: 250,
              child: _buildDifficultyPieChart(summary.accuracyByDifficulty),
            ),

            // Removed accuracy by topic chart
          ],
        ),
      ),
    );
  }

  Widget _buildDifficultyPieChart(Map<String, double> data) {
    final entries = data.entries.toList();

    double total = entries.fold(0, (sum, e) => sum + e.value);

    return PieChart(
      PieChartData(
        sections: entries.asMap().entries.map((entry) {
          final i = entry.key;
          final e = entry.value;
          final percent = total == 0 ? 0 : (e.value / total) * 100;
          final color = Colors.primaries[i % Colors.primaries.length];

          return PieChartSectionData(
            value: e.value,
            title: '${percent.toStringAsFixed(1)}%',
            color: color,
            radius: 80,
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        }).toList(),
        sectionsSpace: 4,
        centerSpaceRadius: 50,
      ),
    );
  }
}
