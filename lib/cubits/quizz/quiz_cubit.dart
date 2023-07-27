import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  int scoreCounter =0;
  List<dynamic> allAnswers = [];

  void CountScore({required String correcrAnswer,required String choisenAnswer}){
    if(choisenAnswer == correcrAnswer){
      scoreCounter++;

    }
    emit(LevelChoice());
    print('hiii $scoreCounter');
  }


  List<dynamic> MakeACombleteList({required String correcrAnswer,required List<dynamic>incorrectAnswersList}){
    for(int i=0; i<3;i++){
      allAnswers.add(incorrectAnswersList[i]);
    }
    allAnswers.add(correcrAnswer);
    print(allAnswers);
    emit(QuizInitial());
    return allAnswers;

  }
}
