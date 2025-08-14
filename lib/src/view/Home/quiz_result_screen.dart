import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/src/bloc/quiz_bloc/bloc/quiz_bloc.dart';
import 'package:quiz_app/src/widgets/secondary_button.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<QuizBloc>().state;
    final Map<int, bool> answersMap = state.answersMap ?? {};

    double accuracy(int correct, int total) =>
        total == 0 ? 0 : (correct / total) * 100;

    final questions = state.quizQuestions;
    final Map<String, int> correctByDifficulty = {};
    final Map<String, int> wrongByDifficulty = {};
    final Map<String, int> correctByTopic = {};
    final Map<String, int> totalByTopic = {};

    for (int i = 0; i < questions.length; i++) {
      final q = questions[i];
      final isCorrect = answersMap[i] ?? false;

      // Difficulty stats
      final diff = q.difficulty.toString();
      correctByDifficulty[diff] =
          (correctByDifficulty[diff] ?? 0) + (isCorrect ? 1 : 0);
      wrongByDifficulty[diff] =
          (wrongByDifficulty[diff] ?? 0) + (isCorrect ? 0 : 1);

      // Topic stats
      totalByTopic[q.category] = (totalByTopic[q.category] ?? 0) + 1;
      correctByTopic[q.category] =
          (correctByTopic[q.category] ?? 0) + (isCorrect ? 1 : 0);
    }

    final totalCorrect = correctByDifficulty.values.fold(0, (a, b) => a + b);
    final totalWrong = wrongByDifficulty.values.fold(0, (a, b) => a + b);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Quiz Results",
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('Total Questions: ${questions.length}'),
              Text('Correct Answers: $totalCorrect'),
              Text('Wrong Answers: $totalWrong'),
              const SizedBox(height: 20),

              // Accuracy by difficulty
              const Text(
                'Accuracy by Difficulty:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              for (final difficulty in correctByDifficulty.keys)
                Text(
                  '$difficulty: ${accuracy(correctByDifficulty[difficulty] ?? 0, (correctByDifficulty[difficulty] ?? 0) + (wrongByDifficulty[difficulty] ?? 0)).toStringAsFixed(1)}%'
                  ' (${correctByDifficulty[difficulty] ?? 0} / ${(correctByDifficulty[difficulty] ?? 0) + (wrongByDifficulty[difficulty] ?? 0)})',
                ),
              const SizedBox(height: 20),

              Text('Longest Streak: ${state.longestStreak}'),
              Text('Current Streak: ${state.streak}'),
              const SizedBox(height: 20),

              // Topic-wise performance
              const Text(
                'Topic-wise Performance:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              for (final topic in totalByTopic.keys)
                Text(
                  '$topic: ${accuracy(correctByTopic[topic] ?? 0, totalByTopic[topic] ?? 0).toStringAsFixed(1)}%'
                  ' (${correctByTopic[topic] ?? 0} / ${totalByTopic[topic] ?? 0})',
                ),
              const SizedBox(height: 20),

              const Text(
                'Suggestions:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(_buildSuggestions(correctByDifficulty, wrongByDifficulty)),
              const SizedBox(height: 20),

              SecondaryButton(
                text: "Back to Home",
                onPressed: () {
                  Navigator.of(context)
                    ..pop()
                    ..pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _buildSuggestions(
    Map<String, int> correctByDifficulty,
    Map<String, int> wrongByDifficulty,
  ) {
    final accuracies = <String, double>{};
    for (final difficulty in correctByDifficulty.keys) {
      final correct = correctByDifficulty[difficulty] ?? 0;
      final wrong = wrongByDifficulty[difficulty] ?? 0;
      final total = correct + wrong;
      final acc = total == 0 ? 100 : (correct / total) * 100;
      accuracies[difficulty] = acc.toDouble();
    }
    if (accuracies.isEmpty) return "No data for suggestions.";

    final lowest = accuracies.entries.reduce(
      (a, b) => a.value < b.value ? a : b,
    );
    return "Focus on improving your ${lowest.key} difficulty questions "
        "where your accuracy is ${lowest.value.toStringAsFixed(1)}%.";
  }
}
