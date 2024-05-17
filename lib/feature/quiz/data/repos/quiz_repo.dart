import 'package:dartz/dartz.dart';

abstract class QuizRepo {
  Future<Either<dynamic, dynamic>> getQuestions();
  //Future<dynamic> getQuestions();
}
