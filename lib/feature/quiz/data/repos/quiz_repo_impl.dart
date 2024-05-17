import 'package:dartz/dartz.dart';
import 'package:quizzles/core/utils/api/end_points.dart';
import 'package:quizzles/feature/quiz/data/repos/quiz_repo.dart';

import '../../../../core/errors/errors/server_exceptions.dart';
import '../../../../core/utils/api/api_consumer.dart';
import '../models/question_model.dart';

class QuizRepoImpl extends QuizRepo {
  final ApiConsumer apiConsumer;

  QuizRepoImpl(this.apiConsumer);

  @override
  Future<Either<dynamic, List<QuestionModel>>> getQuestions() async {
    try {
      print('hello from repo');
      Map<dynamic, dynamic> data = await apiConsumer.get(
        EndPoints.endPoint,
      );
      List<QuestionModel> questions = [];

      print('hello from repo2');

      for (var item in data['results']) {
        print("the for loopinside");
        questions.add(QuestionModel.fromJson(item));
      }
      print('data is $questions');
      print('hello from repo3');

      //return data;
      return Right(questions);
    } on ServerExceptions catch (e) {
      return Left(e.message);
    }
  }
}
