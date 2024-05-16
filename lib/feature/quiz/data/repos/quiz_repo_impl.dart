import 'package:dartz/dartz.dart';
import 'package:quizzles/core/utils/api/end_points.dart';
import 'package:quizzles/feature/quiz/data/repos/quiz_repo.dart';

import '../../../../core/errors/errors/server_exceptions.dart';
import '../../../../core/utils/api/api_consumer.dart';

class QuizRepoImpl extends QuizRepo {
  final ApiConsumer apiConsumer;

  QuizRepoImpl(this.apiConsumer);

  @override
  Future<Either<String, dynamic>> getQuestions() async {
    try {
      Map<dynamic, dynamic> data = await apiConsumer.get(EndPoints.endPoint);
      return Right(data);
    } on ServerExceptions catch (e) {
      return Left(e.message);
    }
  }
}
