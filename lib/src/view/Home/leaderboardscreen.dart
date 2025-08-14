import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/src/model/quiz_summary.dart';
import 'package:quiz_app/src/service/local_storage_service.dart';

class LeaderboardScreen extends StatefulWidget {
  LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  late ConfettiController _controller;
  final ValueNotifier<String?> selectedCategory = ValueNotifier(null);

  final List<String> categories = ["All", "Math", "Science", "Random"];

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 1));
    _celebrate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _celebrate() {
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Leaderboard", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.orange.shade300,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              ValueListenableBuilder<String?>(
                valueListenable: selectedCategory,
                builder: (context, category, _) {
                  return DropdownButton<String>(
                    value: category ?? "All",
                    items: categories
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (value) {
                      selectedCategory.value = value == "All" ? null : value;
                    },
                  );
                },
              ),
              Expanded(
                child: ValueListenableBuilder<String?>(
                  valueListenable: selectedCategory,
                  builder: (context, category, _) {
                    return FutureBuilder<List<QuizSummary>>(
                      future: loadTopScores(category: category),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final leaderboard = snapshot.data!;
                        if (leaderboard.isEmpty) {
                          return const Center(child: Text("No scores yet"));
                        }

                        return ListView.builder(
                          itemCount: leaderboard.length,
                          itemBuilder: (context, index) {
                            final entry = leaderboard[index];
                            final scorePercent =
                                (entry.correctAnswers /
                                        entry.totalQuestions *
                                        100)
                                    .toStringAsFixed(1);
                            return ListTile(
                              leading: Text("#${index + 1}"),
                              title: Text(entry.quizName),
                              trailing: Text(
                                "${entry.correctAnswers}/${entry.totalQuestions} ($scorePercent%)",
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          // Confetti
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controller,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
              ],
              numberOfParticles: 20,
              gravity: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  Future<List<QuizSummary>> loadTopScores({
    String? category,
    int top = 10,
  }) async {
    final storage = QuizSummaryStorage();
    final summaries = await storage.loadSummaries();

    final filtered = category == null
        ? summaries
        : summaries
              .where((s) => s.quizName.toLowerCase() == category.toLowerCase())
              .toList();

    filtered.sort((a, b) => b.correctAnswers.compareTo(a.correctAnswers));

    return filtered.take(top).toList();
  }
}
