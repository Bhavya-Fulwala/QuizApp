import 'package:flutter/material.dart';
import 'package:quiz_app/src/view/Add-Question_screen.dart';
import 'package:quiz_app/src/view/Home/home_screen.dart';
import 'package:quiz_app/src/view/Home/quiz_screne.dart';
import 'package:quiz_app/src/view/Questions/questions_screen.dart';
import 'package:quiz_app/src/view/Settings/settings_screen.dart';
import 'package:quiz_app/src/view/Stats/stats_screen.dart';
import 'package:quiz_app/src/view/auth/login.dart';
import 'package:quiz_app/src/view/auth/signup.dart';
import 'package:quiz_app/src/view/Home/quizsetup.dart';

class AppRoutes {
  static const String home = '/home';
  static const String signup = '/signup';
  static const String stats = '/stats';
  static const String question = '/question';
  static const String login = '/login';
  static const String settings = '/settings';
  static const String addQuestion = '/add-question'; // Add if you have thist
  static const String quizsetupscreen = '/quizsetupscreen';
  static const String quizscreen = '/quizscreen';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case quizsetupscreen:
        final category = routeSettings.arguments as String? ?? '';
        return MaterialPageRoute(
          builder: (_) => QuizSetupScreen(category: category),
        );
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case quizscreen:
        final category = routeSettings.arguments as String? ?? '';
        return MaterialPageRoute(
          builder: (_) => QuizScreen(category: category),
        );
      case question:
        return MaterialPageRoute(builder: (_) => const StudyModeScreen());
      case stats:
        return MaterialPageRoute(builder: (_) => const QuizHistoryScreen());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case addQuestion:
        return MaterialPageRoute(builder: (_) => const AddQuestionScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
