// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuizEvent()';
}


}

/// @nodoc
class $QuizEventCopyWith<$Res>  {
$QuizEventCopyWith(QuizEvent _, $Res Function(QuizEvent) __);
}


/// Adds pattern-matching-related methods to [QuizEvent].
extension QuizEventPatterns on QuizEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadQuestions value)?  loadQuestions,TResult Function( _StartQuiz value)?  startQuiz,TResult Function( _LoadCategories value)?  loadCategories,TResult Function( _LoadQuestionsByCategory value)?  loadQuestionsByCategory,TResult Function( _AnswerQuestion value)?  answerQuestion,TResult Function( _NextQuestion value)?  nextQuestion,TResult Function( _ResetQuestions value)?  resetQuestions,TResult Function( _UpdateSelectedNumberOfQuestions value)?  updateSelectedNumberOfQuestions,TResult Function( _SelectAnswer value)?  selectAnswer,TResult Function( _LoadStudyQuestions value)?  loadStudyQuestions,TResult Function( _SelectStudyAnswer value)?  selectStudyAnswer,TResult Function( _UpdateStudyFilter value)?  updateStudyFilter,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadQuestions() when loadQuestions != null:
return loadQuestions(_that);case _StartQuiz() when startQuiz != null:
return startQuiz(_that);case _LoadCategories() when loadCategories != null:
return loadCategories(_that);case _LoadQuestionsByCategory() when loadQuestionsByCategory != null:
return loadQuestionsByCategory(_that);case _AnswerQuestion() when answerQuestion != null:
return answerQuestion(_that);case _NextQuestion() when nextQuestion != null:
return nextQuestion(_that);case _ResetQuestions() when resetQuestions != null:
return resetQuestions(_that);case _UpdateSelectedNumberOfQuestions() when updateSelectedNumberOfQuestions != null:
return updateSelectedNumberOfQuestions(_that);case _SelectAnswer() when selectAnswer != null:
return selectAnswer(_that);case _LoadStudyQuestions() when loadStudyQuestions != null:
return loadStudyQuestions(_that);case _SelectStudyAnswer() when selectStudyAnswer != null:
return selectStudyAnswer(_that);case _UpdateStudyFilter() when updateStudyFilter != null:
return updateStudyFilter(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadQuestions value)  loadQuestions,required TResult Function( _StartQuiz value)  startQuiz,required TResult Function( _LoadCategories value)  loadCategories,required TResult Function( _LoadQuestionsByCategory value)  loadQuestionsByCategory,required TResult Function( _AnswerQuestion value)  answerQuestion,required TResult Function( _NextQuestion value)  nextQuestion,required TResult Function( _ResetQuestions value)  resetQuestions,required TResult Function( _UpdateSelectedNumberOfQuestions value)  updateSelectedNumberOfQuestions,required TResult Function( _SelectAnswer value)  selectAnswer,required TResult Function( _LoadStudyQuestions value)  loadStudyQuestions,required TResult Function( _SelectStudyAnswer value)  selectStudyAnswer,required TResult Function( _UpdateStudyFilter value)  updateStudyFilter,}){
final _that = this;
switch (_that) {
case _LoadQuestions():
return loadQuestions(_that);case _StartQuiz():
return startQuiz(_that);case _LoadCategories():
return loadCategories(_that);case _LoadQuestionsByCategory():
return loadQuestionsByCategory(_that);case _AnswerQuestion():
return answerQuestion(_that);case _NextQuestion():
return nextQuestion(_that);case _ResetQuestions():
return resetQuestions(_that);case _UpdateSelectedNumberOfQuestions():
return updateSelectedNumberOfQuestions(_that);case _SelectAnswer():
return selectAnswer(_that);case _LoadStudyQuestions():
return loadStudyQuestions(_that);case _SelectStudyAnswer():
return selectStudyAnswer(_that);case _UpdateStudyFilter():
return updateStudyFilter(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadQuestions value)?  loadQuestions,TResult? Function( _StartQuiz value)?  startQuiz,TResult? Function( _LoadCategories value)?  loadCategories,TResult? Function( _LoadQuestionsByCategory value)?  loadQuestionsByCategory,TResult? Function( _AnswerQuestion value)?  answerQuestion,TResult? Function( _NextQuestion value)?  nextQuestion,TResult? Function( _ResetQuestions value)?  resetQuestions,TResult? Function( _UpdateSelectedNumberOfQuestions value)?  updateSelectedNumberOfQuestions,TResult? Function( _SelectAnswer value)?  selectAnswer,TResult? Function( _LoadStudyQuestions value)?  loadStudyQuestions,TResult? Function( _SelectStudyAnswer value)?  selectStudyAnswer,TResult? Function( _UpdateStudyFilter value)?  updateStudyFilter,}){
final _that = this;
switch (_that) {
case _LoadQuestions() when loadQuestions != null:
return loadQuestions(_that);case _StartQuiz() when startQuiz != null:
return startQuiz(_that);case _LoadCategories() when loadCategories != null:
return loadCategories(_that);case _LoadQuestionsByCategory() when loadQuestionsByCategory != null:
return loadQuestionsByCategory(_that);case _AnswerQuestion() when answerQuestion != null:
return answerQuestion(_that);case _NextQuestion() when nextQuestion != null:
return nextQuestion(_that);case _ResetQuestions() when resetQuestions != null:
return resetQuestions(_that);case _UpdateSelectedNumberOfQuestions() when updateSelectedNumberOfQuestions != null:
return updateSelectedNumberOfQuestions(_that);case _SelectAnswer() when selectAnswer != null:
return selectAnswer(_that);case _LoadStudyQuestions() when loadStudyQuestions != null:
return loadStudyQuestions(_that);case _SelectStudyAnswer() when selectStudyAnswer != null:
return selectStudyAnswer(_that);case _UpdateStudyFilter() when updateStudyFilter != null:
return updateStudyFilter(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadQuestions,TResult Function( int numberOfQuestions,  String? topic)?  startQuiz,TResult Function()?  loadCategories,TResult Function( String category)?  loadQuestionsByCategory,TResult Function( int selectedAnswer)?  answerQuestion,TResult Function()?  nextQuestion,TResult Function()?  resetQuestions,TResult Function( int number)?  updateSelectedNumberOfQuestions,TResult Function( int selectedanswerindex)?  selectAnswer,TResult Function( String? category)?  loadStudyQuestions,TResult Function( int questionIndex,  int selectedAnswerIndex)?  selectStudyAnswer,TResult Function( String? topic,  Difficulty? difficulty)?  updateStudyFilter,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadQuestions() when loadQuestions != null:
return loadQuestions();case _StartQuiz() when startQuiz != null:
return startQuiz(_that.numberOfQuestions,_that.topic);case _LoadCategories() when loadCategories != null:
return loadCategories();case _LoadQuestionsByCategory() when loadQuestionsByCategory != null:
return loadQuestionsByCategory(_that.category);case _AnswerQuestion() when answerQuestion != null:
return answerQuestion(_that.selectedAnswer);case _NextQuestion() when nextQuestion != null:
return nextQuestion();case _ResetQuestions() when resetQuestions != null:
return resetQuestions();case _UpdateSelectedNumberOfQuestions() when updateSelectedNumberOfQuestions != null:
return updateSelectedNumberOfQuestions(_that.number);case _SelectAnswer() when selectAnswer != null:
return selectAnswer(_that.selectedanswerindex);case _LoadStudyQuestions() when loadStudyQuestions != null:
return loadStudyQuestions(_that.category);case _SelectStudyAnswer() when selectStudyAnswer != null:
return selectStudyAnswer(_that.questionIndex,_that.selectedAnswerIndex);case _UpdateStudyFilter() when updateStudyFilter != null:
return updateStudyFilter(_that.topic,_that.difficulty);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadQuestions,required TResult Function( int numberOfQuestions,  String? topic)  startQuiz,required TResult Function()  loadCategories,required TResult Function( String category)  loadQuestionsByCategory,required TResult Function( int selectedAnswer)  answerQuestion,required TResult Function()  nextQuestion,required TResult Function()  resetQuestions,required TResult Function( int number)  updateSelectedNumberOfQuestions,required TResult Function( int selectedanswerindex)  selectAnswer,required TResult Function( String? category)  loadStudyQuestions,required TResult Function( int questionIndex,  int selectedAnswerIndex)  selectStudyAnswer,required TResult Function( String? topic,  Difficulty? difficulty)  updateStudyFilter,}) {final _that = this;
switch (_that) {
case _LoadQuestions():
return loadQuestions();case _StartQuiz():
return startQuiz(_that.numberOfQuestions,_that.topic);case _LoadCategories():
return loadCategories();case _LoadQuestionsByCategory():
return loadQuestionsByCategory(_that.category);case _AnswerQuestion():
return answerQuestion(_that.selectedAnswer);case _NextQuestion():
return nextQuestion();case _ResetQuestions():
return resetQuestions();case _UpdateSelectedNumberOfQuestions():
return updateSelectedNumberOfQuestions(_that.number);case _SelectAnswer():
return selectAnswer(_that.selectedanswerindex);case _LoadStudyQuestions():
return loadStudyQuestions(_that.category);case _SelectStudyAnswer():
return selectStudyAnswer(_that.questionIndex,_that.selectedAnswerIndex);case _UpdateStudyFilter():
return updateStudyFilter(_that.topic,_that.difficulty);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadQuestions,TResult? Function( int numberOfQuestions,  String? topic)?  startQuiz,TResult? Function()?  loadCategories,TResult? Function( String category)?  loadQuestionsByCategory,TResult? Function( int selectedAnswer)?  answerQuestion,TResult? Function()?  nextQuestion,TResult? Function()?  resetQuestions,TResult? Function( int number)?  updateSelectedNumberOfQuestions,TResult? Function( int selectedanswerindex)?  selectAnswer,TResult? Function( String? category)?  loadStudyQuestions,TResult? Function( int questionIndex,  int selectedAnswerIndex)?  selectStudyAnswer,TResult? Function( String? topic,  Difficulty? difficulty)?  updateStudyFilter,}) {final _that = this;
switch (_that) {
case _LoadQuestions() when loadQuestions != null:
return loadQuestions();case _StartQuiz() when startQuiz != null:
return startQuiz(_that.numberOfQuestions,_that.topic);case _LoadCategories() when loadCategories != null:
return loadCategories();case _LoadQuestionsByCategory() when loadQuestionsByCategory != null:
return loadQuestionsByCategory(_that.category);case _AnswerQuestion() when answerQuestion != null:
return answerQuestion(_that.selectedAnswer);case _NextQuestion() when nextQuestion != null:
return nextQuestion();case _ResetQuestions() when resetQuestions != null:
return resetQuestions();case _UpdateSelectedNumberOfQuestions() when updateSelectedNumberOfQuestions != null:
return updateSelectedNumberOfQuestions(_that.number);case _SelectAnswer() when selectAnswer != null:
return selectAnswer(_that.selectedanswerindex);case _LoadStudyQuestions() when loadStudyQuestions != null:
return loadStudyQuestions(_that.category);case _SelectStudyAnswer() when selectStudyAnswer != null:
return selectStudyAnswer(_that.questionIndex,_that.selectedAnswerIndex);case _UpdateStudyFilter() when updateStudyFilter != null:
return updateStudyFilter(_that.topic,_that.difficulty);case _:
  return null;

}
}

}

/// @nodoc


class _LoadQuestions implements QuizEvent {
  const _LoadQuestions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadQuestions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuizEvent.loadQuestions()';
}


}




/// @nodoc


class _StartQuiz implements QuizEvent {
  const _StartQuiz({required this.numberOfQuestions, this.topic});
  

 final  int numberOfQuestions;
 final  String? topic;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartQuizCopyWith<_StartQuiz> get copyWith => __$StartQuizCopyWithImpl<_StartQuiz>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartQuiz&&(identical(other.numberOfQuestions, numberOfQuestions) || other.numberOfQuestions == numberOfQuestions)&&(identical(other.topic, topic) || other.topic == topic));
}


@override
int get hashCode => Object.hash(runtimeType,numberOfQuestions,topic);

@override
String toString() {
  return 'QuizEvent.startQuiz(numberOfQuestions: $numberOfQuestions, topic: $topic)';
}


}

/// @nodoc
abstract mixin class _$StartQuizCopyWith<$Res> implements $QuizEventCopyWith<$Res> {
  factory _$StartQuizCopyWith(_StartQuiz value, $Res Function(_StartQuiz) _then) = __$StartQuizCopyWithImpl;
@useResult
$Res call({
 int numberOfQuestions, String? topic
});




}
/// @nodoc
class __$StartQuizCopyWithImpl<$Res>
    implements _$StartQuizCopyWith<$Res> {
  __$StartQuizCopyWithImpl(this._self, this._then);

  final _StartQuiz _self;
  final $Res Function(_StartQuiz) _then;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? numberOfQuestions = null,Object? topic = freezed,}) {
  return _then(_StartQuiz(
numberOfQuestions: null == numberOfQuestions ? _self.numberOfQuestions : numberOfQuestions // ignore: cast_nullable_to_non_nullable
as int,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadCategories implements QuizEvent {
  const _LoadCategories();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadCategories);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuizEvent.loadCategories()';
}


}




/// @nodoc


class _LoadQuestionsByCategory implements QuizEvent {
  const _LoadQuestionsByCategory({required this.category});
  

 final  String category;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadQuestionsByCategoryCopyWith<_LoadQuestionsByCategory> get copyWith => __$LoadQuestionsByCategoryCopyWithImpl<_LoadQuestionsByCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadQuestionsByCategory&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'QuizEvent.loadQuestionsByCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class _$LoadQuestionsByCategoryCopyWith<$Res> implements $QuizEventCopyWith<$Res> {
  factory _$LoadQuestionsByCategoryCopyWith(_LoadQuestionsByCategory value, $Res Function(_LoadQuestionsByCategory) _then) = __$LoadQuestionsByCategoryCopyWithImpl;
@useResult
$Res call({
 String category
});




}
/// @nodoc
class __$LoadQuestionsByCategoryCopyWithImpl<$Res>
    implements _$LoadQuestionsByCategoryCopyWith<$Res> {
  __$LoadQuestionsByCategoryCopyWithImpl(this._self, this._then);

  final _LoadQuestionsByCategory _self;
  final $Res Function(_LoadQuestionsByCategory) _then;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_LoadQuestionsByCategory(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AnswerQuestion implements QuizEvent {
  const _AnswerQuestion({required this.selectedAnswer});
  

 final  int selectedAnswer;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswerQuestionCopyWith<_AnswerQuestion> get copyWith => __$AnswerQuestionCopyWithImpl<_AnswerQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnswerQuestion&&(identical(other.selectedAnswer, selectedAnswer) || other.selectedAnswer == selectedAnswer));
}


@override
int get hashCode => Object.hash(runtimeType,selectedAnswer);

@override
String toString() {
  return 'QuizEvent.answerQuestion(selectedAnswer: $selectedAnswer)';
}


}

/// @nodoc
abstract mixin class _$AnswerQuestionCopyWith<$Res> implements $QuizEventCopyWith<$Res> {
  factory _$AnswerQuestionCopyWith(_AnswerQuestion value, $Res Function(_AnswerQuestion) _then) = __$AnswerQuestionCopyWithImpl;
@useResult
$Res call({
 int selectedAnswer
});




}
/// @nodoc
class __$AnswerQuestionCopyWithImpl<$Res>
    implements _$AnswerQuestionCopyWith<$Res> {
  __$AnswerQuestionCopyWithImpl(this._self, this._then);

  final _AnswerQuestion _self;
  final $Res Function(_AnswerQuestion) _then;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedAnswer = null,}) {
  return _then(_AnswerQuestion(
selectedAnswer: null == selectedAnswer ? _self.selectedAnswer : selectedAnswer // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _NextQuestion implements QuizEvent {
  const _NextQuestion();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextQuestion);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuizEvent.nextQuestion()';
}


}




/// @nodoc


class _ResetQuestions implements QuizEvent {
  const _ResetQuestions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetQuestions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuizEvent.resetQuestions()';
}


}




/// @nodoc


class _UpdateSelectedNumberOfQuestions implements QuizEvent {
  const _UpdateSelectedNumberOfQuestions({required this.number});
  

 final  int number;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSelectedNumberOfQuestionsCopyWith<_UpdateSelectedNumberOfQuestions> get copyWith => __$UpdateSelectedNumberOfQuestionsCopyWithImpl<_UpdateSelectedNumberOfQuestions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSelectedNumberOfQuestions&&(identical(other.number, number) || other.number == number));
}


@override
int get hashCode => Object.hash(runtimeType,number);

@override
String toString() {
  return 'QuizEvent.updateSelectedNumberOfQuestions(number: $number)';
}


}

/// @nodoc
abstract mixin class _$UpdateSelectedNumberOfQuestionsCopyWith<$Res> implements $QuizEventCopyWith<$Res> {
  factory _$UpdateSelectedNumberOfQuestionsCopyWith(_UpdateSelectedNumberOfQuestions value, $Res Function(_UpdateSelectedNumberOfQuestions) _then) = __$UpdateSelectedNumberOfQuestionsCopyWithImpl;
@useResult
$Res call({
 int number
});




}
/// @nodoc
class __$UpdateSelectedNumberOfQuestionsCopyWithImpl<$Res>
    implements _$UpdateSelectedNumberOfQuestionsCopyWith<$Res> {
  __$UpdateSelectedNumberOfQuestionsCopyWithImpl(this._self, this._then);

  final _UpdateSelectedNumberOfQuestions _self;
  final $Res Function(_UpdateSelectedNumberOfQuestions) _then;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? number = null,}) {
  return _then(_UpdateSelectedNumberOfQuestions(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SelectAnswer implements QuizEvent {
  const _SelectAnswer(this.selectedanswerindex);
  

 final  int selectedanswerindex;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectAnswerCopyWith<_SelectAnswer> get copyWith => __$SelectAnswerCopyWithImpl<_SelectAnswer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectAnswer&&(identical(other.selectedanswerindex, selectedanswerindex) || other.selectedanswerindex == selectedanswerindex));
}


@override
int get hashCode => Object.hash(runtimeType,selectedanswerindex);

@override
String toString() {
  return 'QuizEvent.selectAnswer(selectedanswerindex: $selectedanswerindex)';
}


}

/// @nodoc
abstract mixin class _$SelectAnswerCopyWith<$Res> implements $QuizEventCopyWith<$Res> {
  factory _$SelectAnswerCopyWith(_SelectAnswer value, $Res Function(_SelectAnswer) _then) = __$SelectAnswerCopyWithImpl;
@useResult
$Res call({
 int selectedanswerindex
});




}
/// @nodoc
class __$SelectAnswerCopyWithImpl<$Res>
    implements _$SelectAnswerCopyWith<$Res> {
  __$SelectAnswerCopyWithImpl(this._self, this._then);

  final _SelectAnswer _self;
  final $Res Function(_SelectAnswer) _then;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedanswerindex = null,}) {
  return _then(_SelectAnswer(
null == selectedanswerindex ? _self.selectedanswerindex : selectedanswerindex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _LoadStudyQuestions implements QuizEvent {
  const _LoadStudyQuestions({this.category});
  

 final  String? category;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadStudyQuestionsCopyWith<_LoadStudyQuestions> get copyWith => __$LoadStudyQuestionsCopyWithImpl<_LoadStudyQuestions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadStudyQuestions&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'QuizEvent.loadStudyQuestions(category: $category)';
}


}

/// @nodoc
abstract mixin class _$LoadStudyQuestionsCopyWith<$Res> implements $QuizEventCopyWith<$Res> {
  factory _$LoadStudyQuestionsCopyWith(_LoadStudyQuestions value, $Res Function(_LoadStudyQuestions) _then) = __$LoadStudyQuestionsCopyWithImpl;
@useResult
$Res call({
 String? category
});




}
/// @nodoc
class __$LoadStudyQuestionsCopyWithImpl<$Res>
    implements _$LoadStudyQuestionsCopyWith<$Res> {
  __$LoadStudyQuestionsCopyWithImpl(this._self, this._then);

  final _LoadStudyQuestions _self;
  final $Res Function(_LoadStudyQuestions) _then;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = freezed,}) {
  return _then(_LoadStudyQuestions(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SelectStudyAnswer implements QuizEvent {
  const _SelectStudyAnswer({required this.questionIndex, required this.selectedAnswerIndex});
  

 final  int questionIndex;
 final  int selectedAnswerIndex;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectStudyAnswerCopyWith<_SelectStudyAnswer> get copyWith => __$SelectStudyAnswerCopyWithImpl<_SelectStudyAnswer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectStudyAnswer&&(identical(other.questionIndex, questionIndex) || other.questionIndex == questionIndex)&&(identical(other.selectedAnswerIndex, selectedAnswerIndex) || other.selectedAnswerIndex == selectedAnswerIndex));
}


@override
int get hashCode => Object.hash(runtimeType,questionIndex,selectedAnswerIndex);

@override
String toString() {
  return 'QuizEvent.selectStudyAnswer(questionIndex: $questionIndex, selectedAnswerIndex: $selectedAnswerIndex)';
}


}

/// @nodoc
abstract mixin class _$SelectStudyAnswerCopyWith<$Res> implements $QuizEventCopyWith<$Res> {
  factory _$SelectStudyAnswerCopyWith(_SelectStudyAnswer value, $Res Function(_SelectStudyAnswer) _then) = __$SelectStudyAnswerCopyWithImpl;
@useResult
$Res call({
 int questionIndex, int selectedAnswerIndex
});




}
/// @nodoc
class __$SelectStudyAnswerCopyWithImpl<$Res>
    implements _$SelectStudyAnswerCopyWith<$Res> {
  __$SelectStudyAnswerCopyWithImpl(this._self, this._then);

  final _SelectStudyAnswer _self;
  final $Res Function(_SelectStudyAnswer) _then;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? questionIndex = null,Object? selectedAnswerIndex = null,}) {
  return _then(_SelectStudyAnswer(
questionIndex: null == questionIndex ? _self.questionIndex : questionIndex // ignore: cast_nullable_to_non_nullable
as int,selectedAnswerIndex: null == selectedAnswerIndex ? _self.selectedAnswerIndex : selectedAnswerIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdateStudyFilter implements QuizEvent {
  const _UpdateStudyFilter({this.topic, this.difficulty});
  

 final  String? topic;
 final  Difficulty? difficulty;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateStudyFilterCopyWith<_UpdateStudyFilter> get copyWith => __$UpdateStudyFilterCopyWithImpl<_UpdateStudyFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateStudyFilter&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty));
}


@override
int get hashCode => Object.hash(runtimeType,topic,difficulty);

@override
String toString() {
  return 'QuizEvent.updateStudyFilter(topic: $topic, difficulty: $difficulty)';
}


}

/// @nodoc
abstract mixin class _$UpdateStudyFilterCopyWith<$Res> implements $QuizEventCopyWith<$Res> {
  factory _$UpdateStudyFilterCopyWith(_UpdateStudyFilter value, $Res Function(_UpdateStudyFilter) _then) = __$UpdateStudyFilterCopyWithImpl;
@useResult
$Res call({
 String? topic, Difficulty? difficulty
});




}
/// @nodoc
class __$UpdateStudyFilterCopyWithImpl<$Res>
    implements _$UpdateStudyFilterCopyWith<$Res> {
  __$UpdateStudyFilterCopyWithImpl(this._self, this._then);

  final _UpdateStudyFilter _self;
  final $Res Function(_UpdateStudyFilter) _then;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? topic = freezed,Object? difficulty = freezed,}) {
  return _then(_UpdateStudyFilter(
topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty?,
  ));
}


}

/// @nodoc
mixin _$QuizState {

 bool get isLoading; List<QuestionModel> get allQuestions; List<QuestionModel> get quizQuestions; List<String> get allCategories; int get currentIndex; int get score; int get correctAnswers; int get wrongAnswers; int get streak; String get currentDifficulty; int get selectedNumberOfQuestions; bool get quizInProgress; String? get errorMessage;// New UI state
 int? get selectedAnswerIndex; bool get showFeedback; bool get answeredCorrectly;//result
 Map<String, int> get correctAnswersByDifficulty;// e.g. {'easy': 3, 'medium':5}
 Map<String, int> get wrongAnswersByDifficulty; Map<String, int> get totalQuestionsByTopic; Map<String, int> get correctAnswersByTopic; int get longestStreak; Map<int, bool> get answersMap;// Study Mode
 List<QuestionModel> get studyQuestions;// filtered list for display
 List<QuestionModel> get allStudyQuestions;// keep all fetched questions for local filtering
 Map<int, int> get selectedStudyAnswers; String? get selectedStudyTopic;// null means "All"
 Difficulty? get selectedStudyDifficulty;
/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizStateCopyWith<QuizState> get copyWith => _$QuizStateCopyWithImpl<QuizState>(this as QuizState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.allQuestions, allQuestions)&&const DeepCollectionEquality().equals(other.quizQuestions, quizQuestions)&&const DeepCollectionEquality().equals(other.allCategories, allCategories)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.score, score) || other.score == score)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.wrongAnswers, wrongAnswers) || other.wrongAnswers == wrongAnswers)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.currentDifficulty, currentDifficulty) || other.currentDifficulty == currentDifficulty)&&(identical(other.selectedNumberOfQuestions, selectedNumberOfQuestions) || other.selectedNumberOfQuestions == selectedNumberOfQuestions)&&(identical(other.quizInProgress, quizInProgress) || other.quizInProgress == quizInProgress)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.selectedAnswerIndex, selectedAnswerIndex) || other.selectedAnswerIndex == selectedAnswerIndex)&&(identical(other.showFeedback, showFeedback) || other.showFeedback == showFeedback)&&(identical(other.answeredCorrectly, answeredCorrectly) || other.answeredCorrectly == answeredCorrectly)&&const DeepCollectionEquality().equals(other.correctAnswersByDifficulty, correctAnswersByDifficulty)&&const DeepCollectionEquality().equals(other.wrongAnswersByDifficulty, wrongAnswersByDifficulty)&&const DeepCollectionEquality().equals(other.totalQuestionsByTopic, totalQuestionsByTopic)&&const DeepCollectionEquality().equals(other.correctAnswersByTopic, correctAnswersByTopic)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&const DeepCollectionEquality().equals(other.answersMap, answersMap)&&const DeepCollectionEquality().equals(other.studyQuestions, studyQuestions)&&const DeepCollectionEquality().equals(other.allStudyQuestions, allStudyQuestions)&&const DeepCollectionEquality().equals(other.selectedStudyAnswers, selectedStudyAnswers)&&(identical(other.selectedStudyTopic, selectedStudyTopic) || other.selectedStudyTopic == selectedStudyTopic)&&(identical(other.selectedStudyDifficulty, selectedStudyDifficulty) || other.selectedStudyDifficulty == selectedStudyDifficulty));
}


@override
int get hashCode => Object.hashAll([runtimeType,isLoading,const DeepCollectionEquality().hash(allQuestions),const DeepCollectionEquality().hash(quizQuestions),const DeepCollectionEquality().hash(allCategories),currentIndex,score,correctAnswers,wrongAnswers,streak,currentDifficulty,selectedNumberOfQuestions,quizInProgress,errorMessage,selectedAnswerIndex,showFeedback,answeredCorrectly,const DeepCollectionEquality().hash(correctAnswersByDifficulty),const DeepCollectionEquality().hash(wrongAnswersByDifficulty),const DeepCollectionEquality().hash(totalQuestionsByTopic),const DeepCollectionEquality().hash(correctAnswersByTopic),longestStreak,const DeepCollectionEquality().hash(answersMap),const DeepCollectionEquality().hash(studyQuestions),const DeepCollectionEquality().hash(allStudyQuestions),const DeepCollectionEquality().hash(selectedStudyAnswers),selectedStudyTopic,selectedStudyDifficulty]);

@override
String toString() {
  return 'QuizState(isLoading: $isLoading, allQuestions: $allQuestions, quizQuestions: $quizQuestions, allCategories: $allCategories, currentIndex: $currentIndex, score: $score, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, streak: $streak, currentDifficulty: $currentDifficulty, selectedNumberOfQuestions: $selectedNumberOfQuestions, quizInProgress: $quizInProgress, errorMessage: $errorMessage, selectedAnswerIndex: $selectedAnswerIndex, showFeedback: $showFeedback, answeredCorrectly: $answeredCorrectly, correctAnswersByDifficulty: $correctAnswersByDifficulty, wrongAnswersByDifficulty: $wrongAnswersByDifficulty, totalQuestionsByTopic: $totalQuestionsByTopic, correctAnswersByTopic: $correctAnswersByTopic, longestStreak: $longestStreak, answersMap: $answersMap, studyQuestions: $studyQuestions, allStudyQuestions: $allStudyQuestions, selectedStudyAnswers: $selectedStudyAnswers, selectedStudyTopic: $selectedStudyTopic, selectedStudyDifficulty: $selectedStudyDifficulty)';
}


}

/// @nodoc
abstract mixin class $QuizStateCopyWith<$Res>  {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) _then) = _$QuizStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<QuestionModel> allQuestions, List<QuestionModel> quizQuestions, List<String> allCategories, int currentIndex, int score, int correctAnswers, int wrongAnswers, int streak, String currentDifficulty, int selectedNumberOfQuestions, bool quizInProgress, String? errorMessage, int? selectedAnswerIndex, bool showFeedback, bool answeredCorrectly, Map<String, int> correctAnswersByDifficulty, Map<String, int> wrongAnswersByDifficulty, Map<String, int> totalQuestionsByTopic, Map<String, int> correctAnswersByTopic, int longestStreak, Map<int, bool> answersMap, List<QuestionModel> studyQuestions, List<QuestionModel> allStudyQuestions, Map<int, int> selectedStudyAnswers, String? selectedStudyTopic, Difficulty? selectedStudyDifficulty
});




}
/// @nodoc
class _$QuizStateCopyWithImpl<$Res>
    implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._self, this._then);

  final QuizState _self;
  final $Res Function(QuizState) _then;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? allQuestions = null,Object? quizQuestions = null,Object? allCategories = null,Object? currentIndex = null,Object? score = null,Object? correctAnswers = null,Object? wrongAnswers = null,Object? streak = null,Object? currentDifficulty = null,Object? selectedNumberOfQuestions = null,Object? quizInProgress = null,Object? errorMessage = freezed,Object? selectedAnswerIndex = freezed,Object? showFeedback = null,Object? answeredCorrectly = null,Object? correctAnswersByDifficulty = null,Object? wrongAnswersByDifficulty = null,Object? totalQuestionsByTopic = null,Object? correctAnswersByTopic = null,Object? longestStreak = null,Object? answersMap = null,Object? studyQuestions = null,Object? allStudyQuestions = null,Object? selectedStudyAnswers = null,Object? selectedStudyTopic = freezed,Object? selectedStudyDifficulty = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,allQuestions: null == allQuestions ? _self.allQuestions : allQuestions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,quizQuestions: null == quizQuestions ? _self.quizQuestions : quizQuestions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,allCategories: null == allCategories ? _self.allCategories : allCategories // ignore: cast_nullable_to_non_nullable
as List<String>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,wrongAnswers: null == wrongAnswers ? _self.wrongAnswers : wrongAnswers // ignore: cast_nullable_to_non_nullable
as int,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as int,currentDifficulty: null == currentDifficulty ? _self.currentDifficulty : currentDifficulty // ignore: cast_nullable_to_non_nullable
as String,selectedNumberOfQuestions: null == selectedNumberOfQuestions ? _self.selectedNumberOfQuestions : selectedNumberOfQuestions // ignore: cast_nullable_to_non_nullable
as int,quizInProgress: null == quizInProgress ? _self.quizInProgress : quizInProgress // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,selectedAnswerIndex: freezed == selectedAnswerIndex ? _self.selectedAnswerIndex : selectedAnswerIndex // ignore: cast_nullable_to_non_nullable
as int?,showFeedback: null == showFeedback ? _self.showFeedback : showFeedback // ignore: cast_nullable_to_non_nullable
as bool,answeredCorrectly: null == answeredCorrectly ? _self.answeredCorrectly : answeredCorrectly // ignore: cast_nullable_to_non_nullable
as bool,correctAnswersByDifficulty: null == correctAnswersByDifficulty ? _self.correctAnswersByDifficulty : correctAnswersByDifficulty // ignore: cast_nullable_to_non_nullable
as Map<String, int>,wrongAnswersByDifficulty: null == wrongAnswersByDifficulty ? _self.wrongAnswersByDifficulty : wrongAnswersByDifficulty // ignore: cast_nullable_to_non_nullable
as Map<String, int>,totalQuestionsByTopic: null == totalQuestionsByTopic ? _self.totalQuestionsByTopic : totalQuestionsByTopic // ignore: cast_nullable_to_non_nullable
as Map<String, int>,correctAnswersByTopic: null == correctAnswersByTopic ? _self.correctAnswersByTopic : correctAnswersByTopic // ignore: cast_nullable_to_non_nullable
as Map<String, int>,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,answersMap: null == answersMap ? _self.answersMap : answersMap // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,studyQuestions: null == studyQuestions ? _self.studyQuestions : studyQuestions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,allStudyQuestions: null == allStudyQuestions ? _self.allStudyQuestions : allStudyQuestions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,selectedStudyAnswers: null == selectedStudyAnswers ? _self.selectedStudyAnswers : selectedStudyAnswers // ignore: cast_nullable_to_non_nullable
as Map<int, int>,selectedStudyTopic: freezed == selectedStudyTopic ? _self.selectedStudyTopic : selectedStudyTopic // ignore: cast_nullable_to_non_nullable
as String?,selectedStudyDifficulty: freezed == selectedStudyDifficulty ? _self.selectedStudyDifficulty : selectedStudyDifficulty // ignore: cast_nullable_to_non_nullable
as Difficulty?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizState].
extension QuizStatePatterns on QuizState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizState value)  $default,){
final _that = this;
switch (_that) {
case _QuizState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizState value)?  $default,){
final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<QuestionModel> allQuestions,  List<QuestionModel> quizQuestions,  List<String> allCategories,  int currentIndex,  int score,  int correctAnswers,  int wrongAnswers,  int streak,  String currentDifficulty,  int selectedNumberOfQuestions,  bool quizInProgress,  String? errorMessage,  int? selectedAnswerIndex,  bool showFeedback,  bool answeredCorrectly,  Map<String, int> correctAnswersByDifficulty,  Map<String, int> wrongAnswersByDifficulty,  Map<String, int> totalQuestionsByTopic,  Map<String, int> correctAnswersByTopic,  int longestStreak,  Map<int, bool> answersMap,  List<QuestionModel> studyQuestions,  List<QuestionModel> allStudyQuestions,  Map<int, int> selectedStudyAnswers,  String? selectedStudyTopic,  Difficulty? selectedStudyDifficulty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that.isLoading,_that.allQuestions,_that.quizQuestions,_that.allCategories,_that.currentIndex,_that.score,_that.correctAnswers,_that.wrongAnswers,_that.streak,_that.currentDifficulty,_that.selectedNumberOfQuestions,_that.quizInProgress,_that.errorMessage,_that.selectedAnswerIndex,_that.showFeedback,_that.answeredCorrectly,_that.correctAnswersByDifficulty,_that.wrongAnswersByDifficulty,_that.totalQuestionsByTopic,_that.correctAnswersByTopic,_that.longestStreak,_that.answersMap,_that.studyQuestions,_that.allStudyQuestions,_that.selectedStudyAnswers,_that.selectedStudyTopic,_that.selectedStudyDifficulty);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<QuestionModel> allQuestions,  List<QuestionModel> quizQuestions,  List<String> allCategories,  int currentIndex,  int score,  int correctAnswers,  int wrongAnswers,  int streak,  String currentDifficulty,  int selectedNumberOfQuestions,  bool quizInProgress,  String? errorMessage,  int? selectedAnswerIndex,  bool showFeedback,  bool answeredCorrectly,  Map<String, int> correctAnswersByDifficulty,  Map<String, int> wrongAnswersByDifficulty,  Map<String, int> totalQuestionsByTopic,  Map<String, int> correctAnswersByTopic,  int longestStreak,  Map<int, bool> answersMap,  List<QuestionModel> studyQuestions,  List<QuestionModel> allStudyQuestions,  Map<int, int> selectedStudyAnswers,  String? selectedStudyTopic,  Difficulty? selectedStudyDifficulty)  $default,) {final _that = this;
switch (_that) {
case _QuizState():
return $default(_that.isLoading,_that.allQuestions,_that.quizQuestions,_that.allCategories,_that.currentIndex,_that.score,_that.correctAnswers,_that.wrongAnswers,_that.streak,_that.currentDifficulty,_that.selectedNumberOfQuestions,_that.quizInProgress,_that.errorMessage,_that.selectedAnswerIndex,_that.showFeedback,_that.answeredCorrectly,_that.correctAnswersByDifficulty,_that.wrongAnswersByDifficulty,_that.totalQuestionsByTopic,_that.correctAnswersByTopic,_that.longestStreak,_that.answersMap,_that.studyQuestions,_that.allStudyQuestions,_that.selectedStudyAnswers,_that.selectedStudyTopic,_that.selectedStudyDifficulty);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<QuestionModel> allQuestions,  List<QuestionModel> quizQuestions,  List<String> allCategories,  int currentIndex,  int score,  int correctAnswers,  int wrongAnswers,  int streak,  String currentDifficulty,  int selectedNumberOfQuestions,  bool quizInProgress,  String? errorMessage,  int? selectedAnswerIndex,  bool showFeedback,  bool answeredCorrectly,  Map<String, int> correctAnswersByDifficulty,  Map<String, int> wrongAnswersByDifficulty,  Map<String, int> totalQuestionsByTopic,  Map<String, int> correctAnswersByTopic,  int longestStreak,  Map<int, bool> answersMap,  List<QuestionModel> studyQuestions,  List<QuestionModel> allStudyQuestions,  Map<int, int> selectedStudyAnswers,  String? selectedStudyTopic,  Difficulty? selectedStudyDifficulty)?  $default,) {final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that.isLoading,_that.allQuestions,_that.quizQuestions,_that.allCategories,_that.currentIndex,_that.score,_that.correctAnswers,_that.wrongAnswers,_that.streak,_that.currentDifficulty,_that.selectedNumberOfQuestions,_that.quizInProgress,_that.errorMessage,_that.selectedAnswerIndex,_that.showFeedback,_that.answeredCorrectly,_that.correctAnswersByDifficulty,_that.wrongAnswersByDifficulty,_that.totalQuestionsByTopic,_that.correctAnswersByTopic,_that.longestStreak,_that.answersMap,_that.studyQuestions,_that.allStudyQuestions,_that.selectedStudyAnswers,_that.selectedStudyTopic,_that.selectedStudyDifficulty);case _:
  return null;

}
}

}

/// @nodoc


class _QuizState implements QuizState {
  const _QuizState({this.isLoading = false, final  List<QuestionModel> allQuestions = const [], final  List<QuestionModel> quizQuestions = const [], final  List<String> allCategories = const [], this.currentIndex = 0, this.score = 0, this.correctAnswers = 0, this.wrongAnswers = 0, this.streak = 0, this.currentDifficulty = "medium", this.selectedNumberOfQuestions = 5, this.quizInProgress = false, this.errorMessage, this.selectedAnswerIndex, this.showFeedback = false, this.answeredCorrectly = false, final  Map<String, int> correctAnswersByDifficulty = const {}, final  Map<String, int> wrongAnswersByDifficulty = const {}, final  Map<String, int> totalQuestionsByTopic = const {}, final  Map<String, int> correctAnswersByTopic = const {}, this.longestStreak = 0, final  Map<int, bool> answersMap = const {}, final  List<QuestionModel> studyQuestions = const [], final  List<QuestionModel> allStudyQuestions = const [], final  Map<int, int> selectedStudyAnswers = const {}, this.selectedStudyTopic, this.selectedStudyDifficulty}): _allQuestions = allQuestions,_quizQuestions = quizQuestions,_allCategories = allCategories,_correctAnswersByDifficulty = correctAnswersByDifficulty,_wrongAnswersByDifficulty = wrongAnswersByDifficulty,_totalQuestionsByTopic = totalQuestionsByTopic,_correctAnswersByTopic = correctAnswersByTopic,_answersMap = answersMap,_studyQuestions = studyQuestions,_allStudyQuestions = allStudyQuestions,_selectedStudyAnswers = selectedStudyAnswers;
  

@override@JsonKey() final  bool isLoading;
 final  List<QuestionModel> _allQuestions;
@override@JsonKey() List<QuestionModel> get allQuestions {
  if (_allQuestions is EqualUnmodifiableListView) return _allQuestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allQuestions);
}

 final  List<QuestionModel> _quizQuestions;
@override@JsonKey() List<QuestionModel> get quizQuestions {
  if (_quizQuestions is EqualUnmodifiableListView) return _quizQuestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quizQuestions);
}

 final  List<String> _allCategories;
@override@JsonKey() List<String> get allCategories {
  if (_allCategories is EqualUnmodifiableListView) return _allCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allCategories);
}

@override@JsonKey() final  int currentIndex;
@override@JsonKey() final  int score;
@override@JsonKey() final  int correctAnswers;
@override@JsonKey() final  int wrongAnswers;
@override@JsonKey() final  int streak;
@override@JsonKey() final  String currentDifficulty;
@override@JsonKey() final  int selectedNumberOfQuestions;
@override@JsonKey() final  bool quizInProgress;
@override final  String? errorMessage;
// New UI state
@override final  int? selectedAnswerIndex;
@override@JsonKey() final  bool showFeedback;
@override@JsonKey() final  bool answeredCorrectly;
//result
 final  Map<String, int> _correctAnswersByDifficulty;
//result
@override@JsonKey() Map<String, int> get correctAnswersByDifficulty {
  if (_correctAnswersByDifficulty is EqualUnmodifiableMapView) return _correctAnswersByDifficulty;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_correctAnswersByDifficulty);
}

// e.g. {'easy': 3, 'medium':5}
 final  Map<String, int> _wrongAnswersByDifficulty;
// e.g. {'easy': 3, 'medium':5}
@override@JsonKey() Map<String, int> get wrongAnswersByDifficulty {
  if (_wrongAnswersByDifficulty is EqualUnmodifiableMapView) return _wrongAnswersByDifficulty;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_wrongAnswersByDifficulty);
}

 final  Map<String, int> _totalQuestionsByTopic;
@override@JsonKey() Map<String, int> get totalQuestionsByTopic {
  if (_totalQuestionsByTopic is EqualUnmodifiableMapView) return _totalQuestionsByTopic;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_totalQuestionsByTopic);
}

 final  Map<String, int> _correctAnswersByTopic;
@override@JsonKey() Map<String, int> get correctAnswersByTopic {
  if (_correctAnswersByTopic is EqualUnmodifiableMapView) return _correctAnswersByTopic;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_correctAnswersByTopic);
}

@override@JsonKey() final  int longestStreak;
 final  Map<int, bool> _answersMap;
@override@JsonKey() Map<int, bool> get answersMap {
  if (_answersMap is EqualUnmodifiableMapView) return _answersMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_answersMap);
}

// Study Mode
 final  List<QuestionModel> _studyQuestions;
// Study Mode
@override@JsonKey() List<QuestionModel> get studyQuestions {
  if (_studyQuestions is EqualUnmodifiableListView) return _studyQuestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_studyQuestions);
}

// filtered list for display
 final  List<QuestionModel> _allStudyQuestions;
// filtered list for display
@override@JsonKey() List<QuestionModel> get allStudyQuestions {
  if (_allStudyQuestions is EqualUnmodifiableListView) return _allStudyQuestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allStudyQuestions);
}

// keep all fetched questions for local filtering
 final  Map<int, int> _selectedStudyAnswers;
// keep all fetched questions for local filtering
@override@JsonKey() Map<int, int> get selectedStudyAnswers {
  if (_selectedStudyAnswers is EqualUnmodifiableMapView) return _selectedStudyAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_selectedStudyAnswers);
}

@override final  String? selectedStudyTopic;
// null means "All"
@override final  Difficulty? selectedStudyDifficulty;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizStateCopyWith<_QuizState> get copyWith => __$QuizStateCopyWithImpl<_QuizState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._allQuestions, _allQuestions)&&const DeepCollectionEquality().equals(other._quizQuestions, _quizQuestions)&&const DeepCollectionEquality().equals(other._allCategories, _allCategories)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.score, score) || other.score == score)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.wrongAnswers, wrongAnswers) || other.wrongAnswers == wrongAnswers)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.currentDifficulty, currentDifficulty) || other.currentDifficulty == currentDifficulty)&&(identical(other.selectedNumberOfQuestions, selectedNumberOfQuestions) || other.selectedNumberOfQuestions == selectedNumberOfQuestions)&&(identical(other.quizInProgress, quizInProgress) || other.quizInProgress == quizInProgress)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.selectedAnswerIndex, selectedAnswerIndex) || other.selectedAnswerIndex == selectedAnswerIndex)&&(identical(other.showFeedback, showFeedback) || other.showFeedback == showFeedback)&&(identical(other.answeredCorrectly, answeredCorrectly) || other.answeredCorrectly == answeredCorrectly)&&const DeepCollectionEquality().equals(other._correctAnswersByDifficulty, _correctAnswersByDifficulty)&&const DeepCollectionEquality().equals(other._wrongAnswersByDifficulty, _wrongAnswersByDifficulty)&&const DeepCollectionEquality().equals(other._totalQuestionsByTopic, _totalQuestionsByTopic)&&const DeepCollectionEquality().equals(other._correctAnswersByTopic, _correctAnswersByTopic)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&const DeepCollectionEquality().equals(other._answersMap, _answersMap)&&const DeepCollectionEquality().equals(other._studyQuestions, _studyQuestions)&&const DeepCollectionEquality().equals(other._allStudyQuestions, _allStudyQuestions)&&const DeepCollectionEquality().equals(other._selectedStudyAnswers, _selectedStudyAnswers)&&(identical(other.selectedStudyTopic, selectedStudyTopic) || other.selectedStudyTopic == selectedStudyTopic)&&(identical(other.selectedStudyDifficulty, selectedStudyDifficulty) || other.selectedStudyDifficulty == selectedStudyDifficulty));
}


@override
int get hashCode => Object.hashAll([runtimeType,isLoading,const DeepCollectionEquality().hash(_allQuestions),const DeepCollectionEquality().hash(_quizQuestions),const DeepCollectionEquality().hash(_allCategories),currentIndex,score,correctAnswers,wrongAnswers,streak,currentDifficulty,selectedNumberOfQuestions,quizInProgress,errorMessage,selectedAnswerIndex,showFeedback,answeredCorrectly,const DeepCollectionEquality().hash(_correctAnswersByDifficulty),const DeepCollectionEquality().hash(_wrongAnswersByDifficulty),const DeepCollectionEquality().hash(_totalQuestionsByTopic),const DeepCollectionEquality().hash(_correctAnswersByTopic),longestStreak,const DeepCollectionEquality().hash(_answersMap),const DeepCollectionEquality().hash(_studyQuestions),const DeepCollectionEquality().hash(_allStudyQuestions),const DeepCollectionEquality().hash(_selectedStudyAnswers),selectedStudyTopic,selectedStudyDifficulty]);

@override
String toString() {
  return 'QuizState(isLoading: $isLoading, allQuestions: $allQuestions, quizQuestions: $quizQuestions, allCategories: $allCategories, currentIndex: $currentIndex, score: $score, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, streak: $streak, currentDifficulty: $currentDifficulty, selectedNumberOfQuestions: $selectedNumberOfQuestions, quizInProgress: $quizInProgress, errorMessage: $errorMessage, selectedAnswerIndex: $selectedAnswerIndex, showFeedback: $showFeedback, answeredCorrectly: $answeredCorrectly, correctAnswersByDifficulty: $correctAnswersByDifficulty, wrongAnswersByDifficulty: $wrongAnswersByDifficulty, totalQuestionsByTopic: $totalQuestionsByTopic, correctAnswersByTopic: $correctAnswersByTopic, longestStreak: $longestStreak, answersMap: $answersMap, studyQuestions: $studyQuestions, allStudyQuestions: $allStudyQuestions, selectedStudyAnswers: $selectedStudyAnswers, selectedStudyTopic: $selectedStudyTopic, selectedStudyDifficulty: $selectedStudyDifficulty)';
}


}

/// @nodoc
abstract mixin class _$QuizStateCopyWith<$Res> implements $QuizStateCopyWith<$Res> {
  factory _$QuizStateCopyWith(_QuizState value, $Res Function(_QuizState) _then) = __$QuizStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<QuestionModel> allQuestions, List<QuestionModel> quizQuestions, List<String> allCategories, int currentIndex, int score, int correctAnswers, int wrongAnswers, int streak, String currentDifficulty, int selectedNumberOfQuestions, bool quizInProgress, String? errorMessage, int? selectedAnswerIndex, bool showFeedback, bool answeredCorrectly, Map<String, int> correctAnswersByDifficulty, Map<String, int> wrongAnswersByDifficulty, Map<String, int> totalQuestionsByTopic, Map<String, int> correctAnswersByTopic, int longestStreak, Map<int, bool> answersMap, List<QuestionModel> studyQuestions, List<QuestionModel> allStudyQuestions, Map<int, int> selectedStudyAnswers, String? selectedStudyTopic, Difficulty? selectedStudyDifficulty
});




}
/// @nodoc
class __$QuizStateCopyWithImpl<$Res>
    implements _$QuizStateCopyWith<$Res> {
  __$QuizStateCopyWithImpl(this._self, this._then);

  final _QuizState _self;
  final $Res Function(_QuizState) _then;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? allQuestions = null,Object? quizQuestions = null,Object? allCategories = null,Object? currentIndex = null,Object? score = null,Object? correctAnswers = null,Object? wrongAnswers = null,Object? streak = null,Object? currentDifficulty = null,Object? selectedNumberOfQuestions = null,Object? quizInProgress = null,Object? errorMessage = freezed,Object? selectedAnswerIndex = freezed,Object? showFeedback = null,Object? answeredCorrectly = null,Object? correctAnswersByDifficulty = null,Object? wrongAnswersByDifficulty = null,Object? totalQuestionsByTopic = null,Object? correctAnswersByTopic = null,Object? longestStreak = null,Object? answersMap = null,Object? studyQuestions = null,Object? allStudyQuestions = null,Object? selectedStudyAnswers = null,Object? selectedStudyTopic = freezed,Object? selectedStudyDifficulty = freezed,}) {
  return _then(_QuizState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,allQuestions: null == allQuestions ? _self._allQuestions : allQuestions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,quizQuestions: null == quizQuestions ? _self._quizQuestions : quizQuestions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,allCategories: null == allCategories ? _self._allCategories : allCategories // ignore: cast_nullable_to_non_nullable
as List<String>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,wrongAnswers: null == wrongAnswers ? _self.wrongAnswers : wrongAnswers // ignore: cast_nullable_to_non_nullable
as int,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as int,currentDifficulty: null == currentDifficulty ? _self.currentDifficulty : currentDifficulty // ignore: cast_nullable_to_non_nullable
as String,selectedNumberOfQuestions: null == selectedNumberOfQuestions ? _self.selectedNumberOfQuestions : selectedNumberOfQuestions // ignore: cast_nullable_to_non_nullable
as int,quizInProgress: null == quizInProgress ? _self.quizInProgress : quizInProgress // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,selectedAnswerIndex: freezed == selectedAnswerIndex ? _self.selectedAnswerIndex : selectedAnswerIndex // ignore: cast_nullable_to_non_nullable
as int?,showFeedback: null == showFeedback ? _self.showFeedback : showFeedback // ignore: cast_nullable_to_non_nullable
as bool,answeredCorrectly: null == answeredCorrectly ? _self.answeredCorrectly : answeredCorrectly // ignore: cast_nullable_to_non_nullable
as bool,correctAnswersByDifficulty: null == correctAnswersByDifficulty ? _self._correctAnswersByDifficulty : correctAnswersByDifficulty // ignore: cast_nullable_to_non_nullable
as Map<String, int>,wrongAnswersByDifficulty: null == wrongAnswersByDifficulty ? _self._wrongAnswersByDifficulty : wrongAnswersByDifficulty // ignore: cast_nullable_to_non_nullable
as Map<String, int>,totalQuestionsByTopic: null == totalQuestionsByTopic ? _self._totalQuestionsByTopic : totalQuestionsByTopic // ignore: cast_nullable_to_non_nullable
as Map<String, int>,correctAnswersByTopic: null == correctAnswersByTopic ? _self._correctAnswersByTopic : correctAnswersByTopic // ignore: cast_nullable_to_non_nullable
as Map<String, int>,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,answersMap: null == answersMap ? _self._answersMap : answersMap // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,studyQuestions: null == studyQuestions ? _self._studyQuestions : studyQuestions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,allStudyQuestions: null == allStudyQuestions ? _self._allStudyQuestions : allStudyQuestions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,selectedStudyAnswers: null == selectedStudyAnswers ? _self._selectedStudyAnswers : selectedStudyAnswers // ignore: cast_nullable_to_non_nullable
as Map<int, int>,selectedStudyTopic: freezed == selectedStudyTopic ? _self.selectedStudyTopic : selectedStudyTopic // ignore: cast_nullable_to_non_nullable
as String?,selectedStudyDifficulty: freezed == selectedStudyDifficulty ? _self.selectedStudyDifficulty : selectedStudyDifficulty // ignore: cast_nullable_to_non_nullable
as Difficulty?,
  ));
}


}

// dart format on
