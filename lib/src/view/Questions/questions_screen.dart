import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/src/bloc/quiz_bloc/bloc/quiz_bloc.dart';
import 'package:quiz_app/src/constants/colors.dart';
import 'package:quiz_app/src/model/question_model.dart';

class StudyModeScreen extends StatefulWidget {
  const StudyModeScreen({super.key});

  @override
  State<StudyModeScreen> createState() => _StudyModeScreenState();
}

class _StudyModeScreenState extends State<StudyModeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<QuizBloc>().add(const QuizEvent.loadStudyQuestions());
  }

  Difficulty? _parseDifficulty(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'easy':
        return Difficulty.easy;
      case 'medium':
        return Difficulty.medium;
      case 'hard':
        return Difficulty.hard;
      default:
        return null;
    }
  }

  String _difficultyToString(Difficulty? diff) {
    if (diff == null) return "All Difficulties";
    switch (diff) {
      case Difficulty.easy:
        return "Easy";
      case Difficulty.medium:
        return "Medium";
      case Difficulty.hard:
        return "Hard";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.studyQuestions.isEmpty) {
          return const Center(child: Text("No questions available"));
        }

        return SafeArea(
          bottom: false,
          child: Column(
            children: [
              _buildFilters(state),
              Expanded(child: _buildQuestionList(state)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilters(QuizState state) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          // Topic Dropdown
          Expanded(
            child: DropdownButton<String>(
              dropdownColor: AppColors.backgroundLight,
              isExpanded: true,
              value: state.selectedStudyTopic,
              hint: const Text("Select Topic"),
              items: [
                const DropdownMenuItem(value: null, child: Text("All Topics")),
                ...state.allCategories
                    .map(
                      (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
                    )
                    .toList(),
              ],
              onChanged: (value) {
                context.read<QuizBloc>().add(
                  QuizEvent.updateStudyFilter(
                    topic: value,
                    difficulty: state.selectedStudyDifficulty,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 8),

          // Difficulty Dropdown
          Expanded(
            child: DropdownButton<String>(
              isExpanded: true,
              value: state.selectedStudyDifficulty != null
                  ? _difficultyToString(state.selectedStudyDifficulty)
                  : null,
              hint: const Text("Select Difficulty"),
              items: [
                const DropdownMenuItem(
                  value: null,
                  child: Text("All Difficulties"),
                ),
                const DropdownMenuItem(value: "Easy", child: Text("Easy")),
                const DropdownMenuItem(value: "Medium", child: Text("Medium")),
                const DropdownMenuItem(value: "Hard", child: Text("Hard")),
              ],
              onChanged: (value) {
                final difficulty = _parseDifficulty(value);
                context.read<QuizBloc>().add(
                  QuizEvent.updateStudyFilter(
                    topic: state.selectedStudyTopic,
                    difficulty: difficulty,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionList(QuizState state) {
    return ListView.builder(
      itemCount: state.studyQuestions.length,
      itemBuilder: (context, index) {
        final question = state.studyQuestions[index];
        final selected = state.selectedStudyAnswers[index];
        return _buildQuestionCard(question, selected, index);
      },
    );
  }

  Widget _buildQuestionCard(question, int? selected, int index) {
    return Card(
      color: AppColors.cardLight,
      elevation: 4,
      shadowColor: Colors.orange.shade300,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.questionText,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            for (int i = 0; i < question.options.length; i++)
              _buildOption(
                question.options[i],
                i == question.correctAnswerIndex,
                selected == i,
                index,
                i,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(
    String text,
    bool isCorrect,
    bool isSelected,
    int questionIndex,
    int optionIndex,
  ) {
    return InkWell(
      onTap: () {
        context.read<QuizBloc>().add(
          QuizEvent.selectStudyAnswer(
            questionIndex: questionIndex,
            selectedAnswerIndex: optionIndex,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isCorrect ? "Correct!" : "Wrong!"),
            backgroundColor: isCorrect ? AppColors.success : AppColors.hard,
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(top: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? (isCorrect ? Colors.green.shade100 : Colors.red.shade100)
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text),
      ),
    );
  }
}
