import 'package:quiz_app/src/model/quiz_summary.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizSummaryStorage {
  static const String _key = 'quiz_summaries';

  Future<List<QuizSummary>> loadSummaries() async {
    final prefs = await SharedPreferences.getInstance();
    final summariesJsonList = prefs.getStringList(_key) ?? [];
    return summariesJsonList.map((jsonStr) => QuizSummary.fromJson(jsonStr)).toList();
  }

  Future<void> saveSummary(QuizSummary summary) async {
    final prefs = await SharedPreferences.getInstance();
    final currentList = prefs.getStringList(_key) ?? [];
    currentList.add(summary.toJson());
    await prefs.setStringList(_key, currentList);
  }

  Future<void> clearSummaries() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
