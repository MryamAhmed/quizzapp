import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzles/feature/home/presentation/home_screen.dart';
import 'package:quizzles/feature/levels/presentation/managr/level/level_cubit.dart';
import 'package:quizzles/helper/cashehelper.dart';

import 'cubits/quizz/quiz_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.init();
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => QuizCubit()),
        BlocProvider(create: (context) => LevelCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
