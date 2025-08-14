import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/src/bloc/quiz_bloc/bloc/quiz_bloc.dart';
import 'package:quiz_app/src/constants/colors.dart';
import 'package:quiz_app/src/utils/rourtes.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (!state.isLoading && state.allCategories.isEmpty) {
          context.read<QuizBloc>().add(const QuizEvent.loadCategories());
        }

        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.errorMessage?.isNotEmpty ?? false) {
          return Center(child: Text(state.errorMessage!));
        }

        final categories = state.allCategories;

        if (categories.isEmpty) {
          return const Center(child: Text("No categories found."));
        }

        // Insert a "Random" category at the beginning
        final displayedCategories = ['Random'] + categories;

        return GridView.builder(
          itemCount: displayedCategories.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            final category = displayedCategories[index];
            final String title = category.toString();

            Color color;
            IconData icon;

            if (title.toLowerCase() == 'random') {
              color = Colors.orange;
              icon = Icons.shuffle;
            } else {
              switch (title.toLowerCase()) {
                case 'math':
                  color = Colors.red;
                  icon = Icons.calculate;
                  break;
                case 'science':
                  color = Colors.green;
                  icon = Icons.science;
                  break;
                case 'history':
                  color = Colors.blue;
                  icon = Icons.history_edu;
                  break;
                case 'geography':
                  color = Colors.deepPurple;
                  icon = Icons.map;
                  break;
                default:
                  color = Colors.grey.shade600;
                  icon = Icons.category;
              }
            }

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.quizsetupscreen,
                  arguments: title.toLowerCase() == 'random'
                      ? 'random'
                      : category,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.cardLight, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 40, color: AppColors.cardLight),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimaryDark,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
