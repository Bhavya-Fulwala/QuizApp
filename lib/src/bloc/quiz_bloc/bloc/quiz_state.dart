part of 'quiz_bloc.dart';

@freezed
abstract class QuizState with _$QuizState {
  const factory QuizState({
    @Default(false) bool isLoading,
    @Default([]) List<QuestionModel> allQuestions,
    @Default([]) List<QuestionModel> quizQuestions,
    @Default([]) List<String> allCategories,
    @Default(0) int currentIndex,
    @Default(0) int score,
    @Default(0) int correctAnswers,
    @Default(0) int wrongAnswers,
    @Default(0) int streak,
    @Default("medium") String currentDifficulty,
    @Default(5) int selectedNumberOfQuestions,
    @Default(false) bool quizInProgress,
    String? errorMessage,

    // New UI state
    int? selectedAnswerIndex,
    @Default(false) bool showFeedback,
    @Default(false) bool answeredCorrectly,

    //result

    @Default({}) Map<String, int> correctAnswersByDifficulty, // e.g. {'easy': 3, 'medium':5}
    @Default({}) Map<String, int> wrongAnswersByDifficulty,
    @Default({}) Map<String, int> totalQuestionsByTopic,
    @Default({}) Map<String, int> correctAnswersByTopic,
    @Default(0) int longestStreak,
    @Default({}) Map<int, bool> answersMap,
    
 // Study Mode
    @Default([]) List<QuestionModel> studyQuestions, // filtered list for display
    @Default([]) List<QuestionModel> allStudyQuestions, // keep all fetched questions for local filtering
    @Default({}) Map<int, int> selectedStudyAnswers,
    String? selectedStudyTopic, // null means "All"
    Difficulty? selectedStudyDifficulty, // null means "All"

    




  }) = _QuizState;
}
