import 'package:flutter/material.dart';
import 'package:quiz_app/src/constants/colors.dart';
import 'package:quiz_app/src/view/Home/home_screen.dart';
import 'package:quiz_app/src/view/Questions/questions_screen.dart';
import 'package:quiz_app/src/view/Stats/stats_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  late final List<Widget> _screens;

  @override
  void initState() {
    _screens = const [
      HomeScreen(),
      QuizHistoryScreen(),
     StudyModeScreen(),
      
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, _) {
          return _screens[index];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, _) {
          return  SafeArea(child:BottomNavigationBar(
            backgroundColor: AppColors.cardLight,
            currentIndex: index,
            onTap: (selected) {
              _selectedIndex.value = selected;
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Stats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.question_answer),
                label: 'Questions',
              ),
             
            ],
          ));
        },
      ),
    );
  }
}
