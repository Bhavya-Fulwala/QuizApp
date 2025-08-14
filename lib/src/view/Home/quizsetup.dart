import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/bloc/quiz_bloc/bloc/quiz_bloc.dart';
import 'package:quiz_app/src/constants/colors.dart';
import 'package:quiz_app/src/model/question_model.dart';
import 'package:quiz_app/src/utils/rourtes.dart';

class QuizSetupScreen extends StatefulWidget {
  final String? category;

  const QuizSetupScreen({Key? key, this.category}) : super(key: key);

  @override
  State<QuizSetupScreen> createState() => _QuizSetupScreenState();
}

class _QuizSetupScreenState extends State<QuizSetupScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    if (widget.category == null || widget.category!.toLowerCase() == 'random') {
      // Load all questions for random quiz
      context.read<QuizBloc>().add(const QuizEvent.loadQuestions());
      print("Loading all questions for random");
    } else {
      // Load questions by specific category
      context.read<QuizBloc>().add(
        QuizEvent.loadQuestionsByCategory(category: widget.category!),
      );
      print("Loading questions by category: ${widget.category}");
    }

    _controller = TextEditingController(text: '5');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final category = widget.category ?? 'Random';

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.black),
        title: Text(
          'Start Quiz - $category',
          style: TextStyle(color: AppColors.black),
        ),
        backgroundColor: Colors.orange.shade300,
      ),
      body: Container(
        decoration: BoxDecoration(color: AppColors.backgroundLight),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<QuizBloc, QuizState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                List<QuestionModel> questionsToUse;

                if (widget.category == null ||
                    widget.category!.toLowerCase() == 'random') {
                  // Use all loaded questions for randojm
                  questionsToUse = state.allQuestions;
                } else {
                  // Filter questions by category
                  final categoryLower = widget.category!.toLowerCase().trim();
                  questionsToUse = state.allQuestions
                      .where(
                        (q) => q.category.toLowerCase().trim() == categoryLower,
                      )
                      .toList();
                }

                final availableQuestionsCount = questionsToUse.length;

                if (availableQuestionsCount == 0) {
                  return Center(
                    child: Text(
                      'No questions available in this category.',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                final selectedNumber = state.selectedNumberOfQuestions.clamp(
                  1,
                  availableQuestionsCount,
                );

                if (_controller.text != selectedNumber.toString()) {
                  _controller.text = selectedNumber.toString();
                  _controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: _controller.text.length),
                  );
                }

                final isInputValid =
                    selectedNumber >= 1 &&
                    selectedNumber <= availableQuestionsCount;

                return LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                'Available questions in "$category"\n$availableQuestionsCount',
                                style: const TextStyle(
                                  color: AppColors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 40),
                              Text(
                                'Select number of questions to attempt:',
                                style: const TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 25),
                              BlocBuilder<QuizBloc, QuizState>(
                                builder: (context, state) {
                                  final maxQuestions = questionsToUse.length;
                                  final selectedNumber = state
                                      .selectedNumberOfQuestions
                                      .clamp(1, maxQuestions);

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Slider(
                                        value: selectedNumber.toDouble(),
                                        min: 1,
                                        max: maxQuestions.toDouble(),
                                        divisions: maxQuestions - 1,
                                        label: selectedNumber.toString(),
                                        activeColor: Colors.orange.shade500,
                                        onChanged: (value) {
                                          context.read<QuizBloc>().add(
                                            QuizEvent.updateSelectedNumberOfQuestions(
                                              number: value.toInt(),
                                            ),
                                          );
                                        },
                                      ),
                                      Center(
                                        child: Text(
                                          'Questions: $selectedNumber / $maxQuestions',
                                          style: const TextStyle(
                                            color: AppColors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),

                              const SizedBox(height: 25),
                              TextField(
                                controller: _controller,
                                style: const TextStyle(color: Colors.black),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.cardLight,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.orange,
                                      width: 2,
                                    ),
                                  ),
                                  hintText:
                                      'Enter a number (max $availableQuestionsCount)',
                                  hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                  errorText:
                                      int.tryParse(_controller.text) == null ||
                                          int.parse(_controller.text) < 1 ||
                                          int.parse(_controller.text) >
                                              availableQuestionsCount
                                      ? 'Please enter a number between 1 and $availableQuestionsCount'
                                      : null,
                                  errorStyle: const TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                onChanged: (value) {
                                  int enteredValue = int.tryParse(value) ?? 1;

                                  // Clampe between 1 and availableQUestionscount
                                  if (enteredValue < 1) {
                                    enteredValue = 1;
                                  } else if (enteredValue >
                                      availableQuestionsCount) {
                                    enteredValue = availableQuestionsCount;
                                  }

                                  if (_controller.text !=
                                      enteredValue.toString()) {
                                    _controller.text = enteredValue.toString();
                                    _controller.selection =
                                        TextSelection.fromPosition(
                                          TextPosition(
                                            offset: _controller.text.length,
                                          ),
                                        );
                                  }

                                  context.read<QuizBloc>().add(
                                    QuizEvent.updateSelectedNumberOfQuestions(
                                      number: enteredValue,
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(height: 60),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange.shade500,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: isInputValid
                                      ? () {
                                          context.read<QuizBloc>().add(
                                            QuizEvent.startQuiz(
                                              topic: widget.category,
                                              numberOfQuestions: selectedNumber,
                                            ),
                                          );
                                          Navigator.pushNamed(
                                            context,
                                            AppRoutes.quizscreen,
                                            arguments: widget.category,
                                          );
                                        }
                                      : null,
                                  child: const Text(
                                    'Start Quiz',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Center(
                                  child: Text(
                                    "Let's Check Your Knowledge ...!",
                                    style: GoogleFonts.lobster(
                                      fontSize: 32,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
