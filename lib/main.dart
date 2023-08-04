import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzles/cubits/level/level_cubit.dart';
import 'package:quizzles/pages/home_screen.dart';
import 'package:quizzles/pages/levels_screen.dart';

import 'cubits/quizz/quiz_cubit.dart';
import 'helper/cashehelper.dart';

void main() {
  CasheHelper.init();
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> QuizCubit()),
        BlocProvider(create: (context)=> LevelCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomeScreen() ,
      ),
    );
  }
}

