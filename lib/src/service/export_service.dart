// import 'dart:io';
// import 'package:csv/csv.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:quiz_app/src/model/quiz_summary.dart';

// Future<void> exportQuizToCSV(List<QuizSummary> summaries) async {
//   List<List<String>> rows = [
//     [
//       "Quiz Name",
//       "Date",
//       "Total Questions",
//       "Correct Answers",
//       "Wrong Answers",
//       "Longest Streak"
//     ],
//   ];

//   for (var s in summaries) {
//     rows.add([
//       s.quizName,
//       s.date.toIso8601String(),
//       s.totalQuestions.toString(),
//       s.correctAnswers.toString(),
//       s.wrongAnswers.toString(),
//       s.longestStreak.toString(),
//     ]);
//   }

//   String csv = const ListToCsvConverter().convert(rows);

//   final dir = await getTemporaryDirectory();
//   final file = File('${dir.path}/quiz_statistics.csv');
//   await file.writeAsString(csv);

//   // Share the CSV file
//   await Share.shareFiles([file.path], text: "My Quiz Statistics");
// }
