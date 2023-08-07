import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/cashehelper.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  int scoreCounter =0;

  static QuizCubit get (context ){
    return BlocProvider.of(context);
  }

  Set<int> level1AnsweredQuestions = {};
  Set<int> level2AnsweredQuestions = {};
  Set<int> level3AnsweredQuestions = {};

  List<int>levelsCountersList=[0,0,0];

  void CountScore({required String correcrAnswer,required String choisenAnswer,id,levelNumber}) {

    if(levelNumber ==  0){
      if (!level1AnsweredQuestions.contains(id)){
        if (choisenAnswer == correcrAnswer) {
          levelsCountersList[levelNumber]++;
          scoreCounter++;
          level1AnsweredQuestions.add(id);
        }
      }
      print(levelsCountersList);
      print(levelNumber);
      //CasheHelper.putData().then((value) => emit(LevelChoice()));
    }
    else if(levelNumber ==  1){
      if (!level2AnsweredQuestions.contains(id)){
        if (choisenAnswer == correcrAnswer) {
          levelsCountersList[levelNumber]++;
          scoreCounter++;
          level2AnsweredQuestions.add(id);
        }
      }
      print(levelsCountersList);
      print(levelNumber);
    }
    else if(levelNumber == 2){
      if (!level3AnsweredQuestions.contains(id)){
        if (choisenAnswer == correcrAnswer) {
          levelsCountersList[levelNumber]++;
          scoreCounter++;
          level3AnsweredQuestions.add(id);
        }
      }
      print(levelsCountersList);
      print(levelNumber);
    }
    emit(LevelChoice());
  }
  /*
  void restartCount(){
    levelsCountersList[0]=0;
    levelsCountersList[1]=0;
    levelsCountersList[2]=0;

    level1AnsweredQuestions = {};
    level2AnsweredQuestions = {};
    level3AnsweredQuestions = {};

  }


   */
  List<dynamic> MakeACombleteList({required String correcrAnswer,required List<dynamic> incorrectAnswersList})
  {
    List<dynamic> allAnswers = [];
    for(int i=0; i<3;i++){
      allAnswers.add(incorrectAnswersList[i]);
    }
    allAnswers.add(correcrAnswer);

    emit(QuizInitial());
    print(allAnswers);

    return allAnswers;
    }



}





