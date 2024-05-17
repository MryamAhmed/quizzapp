import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../feature/quiz/data/repos/quiz_repo.dart';
import '../../feature/quiz/data/repos/quiz_repo_impl.dart';
import '../../feature/quiz/presentation/manager/quizz/quiz_cubit.dart';
import 'api/api_consumer.dart';
import 'api/dio_consumer.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(
    Dio(),
  );

  getIt.registerSingleton<ApiConsumer>(
    DioConsumer(getIt()),
  );

  getIt.registerSingleton<QuizRepo>(
    QuizRepoImpl(
      getIt(),
    ),
  );

  getIt.registerSingleton<QuizCubit>(
    QuizCubit(
      getIt(),
    ),
  );
}
