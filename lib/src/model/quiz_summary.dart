import 'dart:convert';

class QuizSummary {
  final DateTime date;
  final String quizName;
  final int totalQuestions;
  final int correctAnswers;
  final int wrongAnswers;
  final int longestStreak;
  final Map<String, double> accuracyByDifficulty; // like this->{'easy': 80.0, 'mediuum': 70}
  final Map<String, double> accuracyByTopic;      // like->{Math': 90, 'Science': 75

//use wit leader board
  QuizSummary({
    required this.quizName,
    required this.date,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.longestStreak,
    required this.accuracyByDifficulty,
    required this.accuracyByTopic,
  });

  Map<String, dynamic> toMap() {
    return {
      'quizName': quizName,
      'date': date.toIso8601String(),
      'totalQuestions': totalQuestions,
      'correctAnswers': correctAnswers,
      'wrongAnswers': wrongAnswers,
      'longestStreak': longestStreak,
      'accuracyByDifficulty': accuracyByDifficulty,
      'accuracyByTopic': accuracyByTopic,
    };
  }

  factory QuizSummary.fromMap(Map<String, dynamic> map) {
    return QuizSummary(
      quizName: map['quizName'],
      date: DateTime.parse(map['date']),
      totalQuestions: map['totalQuestions'],
      correctAnswers: map['correctAnswers'],
      wrongAnswers: map['wrongAnswers'],
      longestStreak: map['longestStreak'],
      accuracyByDifficulty: Map<String, double>.from(map['accuracyByDifficulty']),
      accuracyByTopic: Map<String, double>.from(map['accuracyByTopic']),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizSummary.fromJson(String source) => QuizSummary.fromMap(json.decode(source));
}
