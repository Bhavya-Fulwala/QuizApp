import 'package:flutter/material.dart';
import 'package:quiz_app/src/constants/colors.dart';
import 'package:quiz_app/src/model/quiz_summary.dart';
import 'package:quiz_app/src/service/local_storage_service.dart';
import 'package:quiz_app/src/view/Stats/indetail_stats.dart';

class QuizHistoryScreen extends StatelessWidget {
  const QuizHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            iconColor: AppColors.black,
            onSelected: (value) {
              if (value == 'Empty') {
                QuizSummaryStorage().clearSummaries();
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'Empty',
                  child: Text("Empty History"),
                ),
              ];
            },
          ),
        ],
        title: const Text(
          'Quiz History',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange.shade300,
      ),
      body: FutureBuilder<List<QuizSummary>>(
        future: QuizSummaryStorage().loadSummaries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No quiz history found.'));
          }
          final summaries = snapshot.data!;
          return ListView.builder(
            itemCount: summaries.length,
            itemBuilder: (context, index) {
              final s = summaries[index];
              return ListTile(
                title: Text('Quiz on ${s.date.toLocal()}'),
                subtitle: Text(
                  'Score: ${s.correctAnswers}/${s.totalQuestions}, Longest streak: ${s.longestStreak}',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizSummaryDetailScreen(summary: s),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
