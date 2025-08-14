import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/src/constants/colors.dart';

enum Difficulty { easy, medium, hard }

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final _formKey = GlobalKey<FormState>();

  final questionController = TextEditingController();
  final option1Controller = TextEditingController();
  final option2Controller = TextEditingController();
  final option3Controller = TextEditingController();
  final option4Controller = TextEditingController();
  final categoryController = TextEditingController();

  final correctAnswerIndexNotifier = ValueNotifier<int>(0);
  final selectedDifficultyNotifier = ValueNotifier<Difficulty>(
    Difficulty.medium,
  );
  final isSubmittingNotifier = ValueNotifier<bool>(false);

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final options = [
      option1Controller.text.trim(),
      option2Controller.text.trim(),
      option3Controller.text.trim(),
      option4Controller.text.trim(),
    ];

    if (options.toSet().length != options.length) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Options must be unique")));
      return;
    }

    isSubmittingNotifier.value = true;

    try {
      await FirebaseFirestore.instance.collection('questions').add({
        'questionText': questionController.text.trim(),
        'options': options,
        'correctAnswerIndex': correctAnswerIndexNotifier.value,
        'difficulty': selectedDifficultyNotifier.value.name,
        'category': categoryController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      questionController.clear();
      option1Controller.clear();
      option2Controller.clear();
      option3Controller.clear();
      option4Controller.clear();
      categoryController.clear();
      correctAnswerIndexNotifier.value = 0;
      selectedDifficultyNotifier.value = Difficulty.medium;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Question added successfully!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      isSubmittingNotifier.value = false;
    }
  }

  @override
  void dispose() {
    questionController.dispose();
    option1Controller.dispose();
    option2Controller.dispose();
    option3Controller.dispose();
    option4Controller.dispose();
    categoryController.dispose();
    correctAnswerIndexNotifier.dispose();
    selectedDifficultyNotifier.dispose();
    isSubmittingNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Add Question",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange.shade300,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Question
              TextFormField(
                controller: questionController,
                decoration: const InputDecoration(
                  labelText: "Question",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 1),
                  ),
                ),
                maxLines: 2,
                validator: (val) =>
                    val == null || val.trim().isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),

              const Text(
                "Options:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              _buildOptionField("Option 1", option1Controller),
              const SizedBox(height: 8),
              _buildOptionField("Option 2", option2Controller),
              const SizedBox(height: 8),
              _buildOptionField("Option 3", option3Controller),
              const SizedBox(height: 8),
              _buildOptionField("Option 4", option4Controller),
              const SizedBox(height: 16),

              // Correct answer dropdown
              ValueListenableBuilder<int>(
                valueListenable: correctAnswerIndexNotifier,
                builder: (_, value, __) {
                  return DropdownButtonFormField<int>(
                    decoration: const InputDecoration(
                      labelText: "Correct Answer",
                      border: OutlineInputBorder(),
                    ),
                    value: value,
                    items: const [
                      DropdownMenuItem(value: 0, child: Text("Option 1")),
                      DropdownMenuItem(value: 1, child: Text("Option 2")),
                      DropdownMenuItem(value: 2, child: Text("Option 3")),
                      DropdownMenuItem(value: 3, child: Text("Option 4")),
                    ],
                    onChanged: (newVal) {
                      if (newVal != null) {
                        correctAnswerIndexNotifier.value = newVal;
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 16),

              // Difficulty dropdown
              ValueListenableBuilder<Difficulty>(
                valueListenable: selectedDifficultyNotifier,
                builder: (_, difficulty, __) {
                  return DropdownButtonFormField<Difficulty>(
                    decoration: const InputDecoration(
                      labelText: "Difficulty",
                      border: OutlineInputBorder(),
                    ),
                    value: difficulty,
                    items: Difficulty.values.map((d) {
                      return DropdownMenuItem(
                        value: d,
                        child: Text(
                          d.name[0].toUpperCase() + d.name.substring(1),
                        ),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      if (newVal != null) {
                        selectedDifficultyNotifier.value = newVal;
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 16),

              // Category
              TextFormField(
                controller: categoryController,
                decoration: const InputDecoration(
                  labelText: "Category (optional)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              // Submit button
              ValueListenableBuilder<bool>(
                valueListenable: isSubmittingNotifier,
                builder: (_, isSubmitting, __) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: isSubmitting ? null : _submit,
                      child: isSubmitting
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text(
                              "Add Question",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.black,
                              ),
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (val) => val == null || val.trim().isEmpty ? "Required" : null,
    );
  }
}
