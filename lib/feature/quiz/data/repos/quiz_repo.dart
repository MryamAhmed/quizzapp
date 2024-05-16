import 'package:dartz/dartz.dart';

abstract class QuizRepo {
  Future<Either<String, dynamic>> getQuestions();
}
