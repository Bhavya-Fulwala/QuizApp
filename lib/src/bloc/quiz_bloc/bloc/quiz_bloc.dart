import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/src/model/question_model.dart';
import 'package:quiz_app/src/service/category_service.dart';
import 'package:quiz_app/src/service/question_service.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';
part 'quiz_bloc.freezed.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuestionService _questionService;
  QuizBloc(this._questionService) : super(const QuizState()) {
    on<_LoadQuestions>(_onLoadQuestions);
    on<_StartQuiz>(_onStartQuiz);
    on<_AnswerQuestion>(_onAnswerQuestion);
    on<_NextQuestion>(_onNextQuestion);
    on<_ResetQuestions>(_onResetQuestions);
    on<_LoadCategories>(_onLoadCategories);
    on<_LoadQuestionsByCategory>(_onLoadQuestionsByCategory);
    on<_UpdateSelectedNumberOfQuestions>(_onUpdateSelectedNumberOfQuestions);
    on<_SelectAnswer>(_onSelectAnswer);
    on<_LoadStudyQuestions>(_onLoadStudyQuestions);
    on<_SelectStudyAnswer>(_onSelectStudyAnswer);
    on<_UpdateStudyFilter>(_onUpdateStudyFilter);
  }



  Future<void> _onUpdateStudyFilter( 
  _UpdateStudyFilter event,
  Emitter<QuizState> emit,
) async {
  final filtered = state.allStudyQuestions.where((q) {
    final matchTopic = event.topic == null || q.category == event.topic;
    final matchDiff = event.difficulty == null || q.difficulty == event.difficulty;
    return matchTopic && matchDiff;
  }).toList();

  emit(state.copyWith(
    selectedStudyTopic: event.topic,
    selectedStudyDifficulty: event.difficulty,
    studyQuestions: filtered,
  ));
}




  Future<void> _onLoadStudyQuestions(
  _LoadStudyQuestions event,
  Emitter<QuizState> emit,
) async {
  emit(state.copyWith(isLoading: true));
  try {
    final questions = await _questionService.getAllQuestions();

    emit(state.copyWith(
      isLoading: false,
      allStudyQuestions: questions,
      studyQuestions: questions, 
      selectedStudyAnswers: {},
      selectedStudyTopic: null,
      selectedStudyDifficulty: null,
    ));
  } catch (e) {
    emit(state.copyWith(isLoading: false, errorMessage: "Failed to load study questions: $e"));
  }
}



  void _onSelectStudyAnswer(
    _SelectStudyAnswer event,
    Emitter<QuizState> emit,
  ) {
    final updatedSelections = Map<int, int>.from(state.selectedStudyAnswers);
    updatedSelections[event.questionIndex] = event.selectedAnswerIndex;

    emit(state.copyWith(selectedStudyAnswers: updatedSelections));
  }


  void _onSelectAnswer(_SelectAnswer event, Emitter<QuizState> emit) {
    emit(
      state.copyWith(
        selectedAnswerIndex: event.selectedanswerindex,
        showFeedback: true,
        answeredCorrectly:
            event.selectedanswerindex ==
            state.quizQuestions[state.currentIndex].correctAnswerIndex,
      ),
    );
  }



  void _onUpdateSelectedNumberOfQuestions(
    _UpdateSelectedNumberOfQuestions event,
    Emitter<QuizState> emit,
  ) {
    emit(state.copyWith(selectedNumberOfQuestions: event.number));
  }

  Future<void> _onLoadCategories(
    _LoadCategories event,
    Emitter<QuizState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final categories = await CategoryService().fetchUniqueCategories();
      print("Categories fetched: ${categories.length}");
      emit(
        state.copyWith(
          isLoading: false,
          allCategories: categories,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: "Failed to load categories: $e",
        ),
      );
    }
  }



  Future<void> _onLoadQuestionsByCategory(
    _LoadQuestionsByCategory event,
    Emitter<QuizState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final questions = await _questionService.getQuestionsByCategory(
        event.category,
      );
      emit(state.copyWith(isLoading: false, allQuestions: questions));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: "Failed to load questions: $e",
        ),
      );
    }
  }



  Future<void> _onLoadQuestions(
    _LoadQuestions event,
    Emitter<QuizState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final questions = await _questionService.getAllQuestions();
      emit(state.copyWith(isLoading: false, allQuestions: questions));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: "Failed to load questions: $e",
        ),
      );
    }
  }



  void _onStartQuiz(_StartQuiz event, Emitter<QuizState> emit) {
    List<QuestionModel> filtered;

    if (event.topic != null && event.topic!.toLowerCase().trim() == "random") {
      filtered = List.from(state.allQuestions);
    } else {
      filtered = state.allQuestions.where((q) {
        return event.topic == null ||
            q.category.toLowerCase().trim() ==
                event.topic!.toLowerCase().trim();
      }).toList();
    }


    filtered.shuffle();
    final quizQs = filtered.take(event.numberOfQuestions).toList();

    emit(
      state.copyWith(
        quizQuestions: quizQs,
        quizInProgress: true,
        currentIndex: 0,
        score: 0,
        correctAnswers: 0,
        wrongAnswers: 0,
        streak: 0,
        currentDifficulty: "medium",
      ),
    );
  }



  void _onAnswerQuestion(_AnswerQuestion event, Emitter<QuizState> emit) {
    final currentQ = state.quizQuestions[state.currentIndex];
    bool isCorrect = event.selectedAnswer == currentQ.correctAnswerIndex;

    int newScore = state.score + (isCorrect ? 10 : 0);
    int newStreak = isCorrect ? state.streak + 1 : 0;
    String newDifficulty = state.currentDifficulty;

    // longeest streak
    int longestStreak = state.longestStreak;
    if (newStreak > longestStreak) {
      longestStreak = newStreak;
    }

    //  difficultys
    
    Map<String, int> correctByDiff = Map.from(state.correctAnswersByDifficulty);
    Map<String, int> wrongByDiff = Map.from(state.wrongAnswersByDifficulty);

    correctByDiff[newDifficulty] =
        (correctByDiff[newDifficulty] ?? 0) + (isCorrect ? 1 : 0);
    wrongByDiff[newDifficulty] =
        (wrongByDiff[newDifficulty] ?? 0) + (isCorrect ? 0 : 1);

    // topic-based counting happeningg
    String topic = currentQ.category;
    Map<String, int> totalByTopic = Map.from(state.totalQuestionsByTopic);
    Map<String, int> correctByTopic = Map.from(state.correctAnswersByTopic);

    totalByTopic[topic] = (totalByTopic[topic] ?? 0) + 1;
    correctByTopic[topic] = (correctByTopic[topic] ?? 0) + (isCorrect ? 1 : 0);

    //  perquestion answ correctness map
    Map<int, bool> updatedAnswersMap = Map.from(state.answersMap);
    updatedAnswersMap[state.currentIndex] = isCorrect;

    if (isCorrect && newStreak >= 2) {
      if (newDifficulty == "medium") {
        newDifficulty = "hard";
      } else if (newDifficulty == "easy")
        newDifficulty = "medium";
    } else if (!isCorrect) {
      if (newDifficulty == "medium") {
        newDifficulty = "easy";
      } else if (newDifficulty == "hard")
        newDifficulty = "medium";
    }

    emit(
      state.copyWith(
        score: newScore,
        correctAnswers: state.correctAnswers + (isCorrect ? 1 : 0),
        wrongAnswers: state.wrongAnswers + (isCorrect ? 0 : 1),
        streak: newStreak,
        longestStreak: longestStreak,
        currentDifficulty: newDifficulty,
        correctAnswersByDifficulty: correctByDiff,
        wrongAnswersByDifficulty: wrongByDiff,
        totalQuestionsByTopic: totalByTopic,
        correctAnswersByTopic: correctByTopic,
        answersMap: updatedAnswersMap,
      ),
    );
  }

  void _onNextQuestion(_NextQuestion event, Emitter<QuizState> emit) {
    if (state.currentIndex < state.quizQuestions.length - 1) {
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
    } else {
      emit(state.copyWith(quizInProgress: false));
    }
  }

  void _onResetQuestions(_ResetQuestions event, Emitter<QuizState> emit) {
    emit(
      state.copyWith(
        quizInProgress: false,
        quizQuestions: [],
        currentIndex: 0,
        score: 0,
        correctAnswers: 0,
        wrongAnswers: 0,
        streak: 0,
        currentDifficulty: "medium",
      ),
    );
  }
}
