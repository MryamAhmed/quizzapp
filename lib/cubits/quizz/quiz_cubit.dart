import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../helper/cashehelper.dart';
import '../../helper/cashehelper.dart';
import '../../helper/cashehelper.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  int scoreCounter = 0;

  static QuizCubit get(context) {
    return BlocProvider.of(context);
  }

  Set<int> level1AnsweredQuestions = {};
  Set<int> level2AnsweredQuestions = {};
  Set<int> level3AnsweredQuestions = {};

  List<int> levelsCountersList = [0, 0, 0];
  List<int> levelsCountersList2 = [0, 0, 0];

  void initSets(){
    level1AnsweredQuestions = {};
    level2AnsweredQuestions = {};
    level3AnsweredQuestions = {};
    levelsCountersList2 = [0, 0, 0];

  }

  void CountScore(
      {required String correcrAnswer,
      required String choisenAnswer,
      id,
      levelNumber}) {
    if (levelNumber == 0) {
      if (!level1AnsweredQuestions.contains(id)) {
        if (choisenAnswer == correcrAnswer) {
          levelsCountersList[levelNumber]++;
          levelsCountersList2[levelNumber]++;
          scoreCounter++;
          level1AnsweredQuestions.add(id);
        }
      }
      print(levelsCountersList);
      print(levelNumber);
      //CasheHelper.putData().then((value) => emit(LevelChoice()));
    } else if (levelNumber == 1) {
      if (!level2AnsweredQuestions.contains(id)) {
        if (choisenAnswer == correcrAnswer) {
          levelsCountersList[levelNumber]++;
          levelsCountersList2[levelNumber]++;
          scoreCounter++;
          level2AnsweredQuestions.add(id);
        }
      }
      print(levelsCountersList);
      print(levelNumber);
    } else if (levelNumber == 2) {
      if (!level3AnsweredQuestions.contains(id)) {
        if (choisenAnswer == correcrAnswer) {
          levelsCountersList[levelNumber]++;
          levelsCountersList2[levelNumber]++;
          scoreCounter++;
          level3AnsweredQuestions.add(id);
        }
      }
      print(levelsCountersList);
      print(levelNumber);
    }

    saveList(levelsCountersList, "scoreList");
    emit(QuizLevelChoice());
  }

  /*
  void restartCount({required int index}) {
    if (index == 0) {
      //restart level 1
      CasheHelper.getIntList("scoreList")[index] = 0;
      level1AnsweredQuestions = {};

      //restart level2
      CasheHelper.getIntList("scoreList")[1] = 0;
      level2AnsweredQuestions = {};

      //restart level3
      CasheHelper.getIntList("scoreList")[2] = 0;
      level3AnsweredQuestions = {};

    } else if (index == 1) {
      //restart level2
      CasheHelper.getIntList("scoreList")[index] = 0;
      level2AnsweredQuestions = {};

      //restart level3
      CasheHelper.getIntList("scoreList")[2] = 0;
      level3AnsweredQuestions = {};

    } else if (index == 2) {
      CasheHelper.getIntList("scoreList")[index] = 0;
      level3AnsweredQuestions = {};
    }

    emit(QuizRestartList());
  }

   */

  List<dynamic> MakeACombleteList(
      {required String correcrAnswer,
      required List<dynamic> incorrectAnswersList}) {
    List<dynamic> allAnswers = [];
    for (int i = 0; i < 3; i++) {
      allAnswers.add(incorrectAnswersList[i]);
    }
    allAnswers.add(correcrAnswer);

    emit(QuizInitial());
    print(allAnswers);

    return allAnswers;
  }

  void saveList(List<int> scoreList, String key) {
    CasheHelper.setIntList(key, scoreList);
  }

  List<int> getList( {required String key}) {
    List<int>? myList = CasheHelper.getIntList(key);
    return myList;
  }

  bool constrians(int level) {
    List<int> myList = getList(key: "scoreList");
    if (myList.isNotEmpty ){
      if(myList[level] >= 5){
        print(myList);
        print(level);
        return true;
      }else {
        print('it is less than 5');
        return false;
      }

    }
    else{
      print('it is null');
      return false;
    }
  }
}
