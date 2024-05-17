part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLevelChoice extends QuizState {}

class QuizRestartList extends QuizState {}

class GetQuestionsSuccess extends QuizState {
  final List<QuestionModel> questions;

  GetQuestionsSuccess(this.questions);
}

class GetQuestionsFauilar extends QuizState {
  final String error;

  GetQuestionsFauilar(this.error);
}

class GetQuestionsLoading extends QuizState {}
