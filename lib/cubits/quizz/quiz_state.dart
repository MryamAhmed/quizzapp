part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLevelChoice extends QuizState {}
class QuizRestartList extends QuizState {}