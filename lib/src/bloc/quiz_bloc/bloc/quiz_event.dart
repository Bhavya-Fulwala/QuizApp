part of 'quiz_bloc.dart';

@freezed
abstract class QuizEvent with _$QuizEvent {
  const factory QuizEvent.loadQuestions() = _LoadQuestions;

  const factory QuizEvent.startQuiz({
    required int numberOfQuestions,
    String? topic,
  }) = _StartQuiz;

  const factory QuizEvent.loadCategories() = _LoadCategories;

  const factory QuizEvent.loadQuestionsByCategory({required String category}) =
      _LoadQuestionsByCategory;

  const factory QuizEvent.answerQuestion({required int selectedAnswer}) =
      _AnswerQuestion;

  const factory QuizEvent.nextQuestion() = _NextQuestion;

  const factory QuizEvent.resetQuestions() = _ResetQuestions;

  const factory QuizEvent.updateSelectedNumberOfQuestions({
    required int number,
  }) = _UpdateSelectedNumberOfQuestions;

  // New event to select answer and show feedback
  const factory QuizEvent.selectAnswer(int selectedanswerindex) = _SelectAnswer;

  const factory QuizEvent.loadStudyQuestions({String? category}) = _LoadStudyQuestions;
  const factory QuizEvent.selectStudyAnswer({
    required int questionIndex,
    required int selectedAnswerIndex,
  }) = _SelectStudyAnswer;

  const factory QuizEvent.updateStudyFilter({
  String? topic,
  Difficulty? difficulty,
}) = _UpdateStudyFilter;


}
