import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/src/bloc/quiz_bloc/bloc/quiz_bloc.dart';
import 'package:quiz_app/src/model/quiz_summary.dart';
import 'package:quiz_app/src/service/local_storage_service.dart';
import 'package:quiz_app/src/view/Home/quiz_result_screen.dart';

class QuizScreen extends StatelessWidget {
  final String category; // Can also be 'Random'
  const QuizScreen({Key? key, required this.category}) : super(key: key);

  String _displayCategory() {
    return category.toLowerCase() == 'random' ? 'Random Quiz' : category;
  }

  void _showQuizResult(BuildContext context) {
    final quizBloc = context.read<QuizBloc>();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text("Quiz Completed!"),
          content: Text(
            "Score: ${quizBloc.state.score}\n"
            "Correct Answers: ${quizBloc.state.correctAnswers}\n"
            "Wrong Answers: ${quizBloc.state.wrongAnswers}",
          ),
          actions: [
            TextButton(
              onPressed: () {
                quizBloc.add(const QuizEvent.resetQuestions());
                Navigator.of(context)
                  ..pop() // close dialog
                  ..pop(); // exit quiz screen
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    final shouldExit =
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Exit Quiz"),
            content: const Text(
              "Are you sure you want to exit the quiz? Your progress will be lost.",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () {
                  context.read<QuizBloc>().add(
                    const QuizEvent.resetQuestions(),
                  );
                  Navigator.of(context).pop(true);
                },
                child: const Text("Yes"),
              ),
            ],
          ),
        ) ??
        false;
    return shouldExit;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            _displayCategory(),
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.orange.shade300,
        ),
        body: BlocConsumer<QuizBloc, QuizState>(
          listenWhen: (previous, current) =>
              previous.quizInProgress && !current.quizInProgress,
          listener: (context, state) {
            _showQuizResult(context);
          },
          builder: (context, state) {
            if (state.quizQuestions.isEmpty) {
              return const Center(child: Text("No questions loaded"));
            }

            final question = state.quizQuestions[state.currentIndex];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress
                  Text(
                    "Question ${state.currentIndex + 1} / ${state.quizQuestions.length}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value:
                        (state.currentIndex + 1) / state.quizQuestions.length,
                    color: Colors.orange.shade400,
                    backgroundColor: Colors.orange.shade100,
                    minHeight: 8,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Difficulty: ${state.currentDifficulty}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Score: ${state.score}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    question.questionText,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: question.options.length,
                      itemBuilder: (context, index) {
                        Color? optionColor;
                        if (state.showFeedback) {
                          if (index == question.correctAnswerIndex) {
                            optionColor = Colors.green.withOpacity(0.7);
                          } else if (state.selectedAnswerIndex == index) {
                            optionColor = Colors.red.withOpacity(0.7);
                          }
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                              color: optionColor ?? Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              title: Text(question.options[index]),
                              onTap: state.selectedAnswerIndex == null
                                  ? () {
                                      context.read<QuizBloc>().add(
                                        QuizEvent.selectAnswer(index),
                                      );
                                      context.read<QuizBloc>().add(
                                        QuizEvent.answerQuestion(
                                          selectedAnswer: index,
                                        ),
                                      );
                                    }
                                  : null,
                              leading: state.showFeedback
                                  ? (index == question.correctAnswerIndex
                                        ? const Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                          )
                                        : (state.selectedAnswerIndex == index
                                              ? const Icon(
                                                  Icons.cancel,
                                                  color: Colors.red,
                                                )
                                              : null))
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SafeArea(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.selectedAnswerIndex != null
                            ? () {
                                if (state.currentIndex <
                                    state.quizQuestions.length - 1) {
                                  context.read<QuizBloc>().add(
                                    const QuizEvent.nextQuestion(),
                                  );
                                  context.read<QuizBloc>().emit(
                                    state.copyWith(
                                      selectedAnswerIndex: null,
                                      showFeedback: false,
                                      answeredCorrectly: false,
                                    ),
                                  );
                                } else {
                                  _saveQuizSummary(context);
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (_) => const QuizResultScreen(),
                                    ),
                                  );
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade700,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          state.currentIndex < state.quizQuestions.length - 1
                              ? 'Next'
                              : 'Finish',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _saveQuizSummary(BuildContext context) async {
    final state = context.read<QuizBloc>().state;

    double _accuracy(int correct, int total) =>
        total == 0 ? 0.0 : (correct / total) * 100;

    final accuracyByDifficulty = <String, double>{};
    for (var entry in state.correctAnswersByDifficulty.entries) {
      final diff = entry.key;
      final correct = entry.value;
      final wrong = state.wrongAnswersByDifficulty[diff] ?? 0;
      accuracyByDifficulty[diff] = _accuracy(correct, correct + wrong);
    }

    final accuracyByTopic = <String, double>{};
    for (var entry in state.totalQuestionsByTopic.entries) {
      final topic = entry.key;
      final total = entry.value;
      final correct = state.correctAnswersByTopic[topic] ?? 0;
      accuracyByTopic[topic] = _accuracy(correct, total);
    }

    final summary = QuizSummary(
      quizName: category.toLowerCase() == 'random' ? 'Random Quiz' : category,
      date: DateTime.now(),
      totalQuestions: state.quizQuestions.length,
      correctAnswers: state.correctAnswers,
      wrongAnswers: state.wrongAnswers,
      longestStreak: state.longestStreak,
      accuracyByDifficulty: accuracyByDifficulty,
      accuracyByTopic: accuracyByTopic,
    );

    await QuizSummaryStorage().saveSummary(summary);
  }
}
