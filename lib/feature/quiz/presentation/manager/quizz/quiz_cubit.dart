import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../helper/cashehelper.dart';
import '../../../data/models/question_model.dart';
import '../../../data/repos/quiz_repo.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit(this.quizRepo) : super(QuizInitial());

  final QuizRepo quizRepo;
  int scoreCounter = 0;

  @override
  void onChange(Change<QuizState> change) {
    super.onChange(change);
    print("listening for change$change");
  }

  static QuizCubit get(context) {
    return BlocProvider.of(context);
  }

  Set<int> level1AnsweredQuestions = {};
  Set<int> level2AnsweredQuestions = {};
  Set<int> level3AnsweredQuestions = {};

  List<int> levelsCountersList = [0, 0, 0];
  List<int> levelsCountersList2 = [0, 0, 0];

  void initSets() {
    level1AnsweredQuestions = {};
    level2AnsweredQuestions = {};
    level3AnsweredQuestions = {};
    levelsCountersList2 = [0, 0, 0];
  }

  void countScore(
      {required String correctAnswer,
      required String choisenAnswer,
      id,
      levelNumber}) {
    if (levelNumber == 0) {
      if (!level1AnsweredQuestions.contains(id)) {
        if (choisenAnswer == correctAnswer) {
          levelsCountersList[levelNumber]++;
          levelsCountersList2[levelNumber]++;
          scoreCounter++;
          level1AnsweredQuestions.add(id);
        }
      }
      print(levelsCountersList);
      print(levelNumber);
    } else if (levelNumber == 1) {
      if (!level2AnsweredQuestions.contains(id)) {
        if (choisenAnswer == correctAnswer) {
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
        if (choisenAnswer == correctAnswer) {
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
    //emit(QuizLevelChoice());
  }

  List<dynamic> MakeACombleteList(
      {required String correcrAnswer,
      required List<dynamic> incorrectAnswersList}) {
    List<dynamic> allAnswers = [];
    for (int i = 0; i < 3; i++) {
      allAnswers.add(incorrectAnswersList[i]);
    }
    allAnswers.add(correcrAnswer);

    //emit(QuizInitial());
    print(allAnswers);

    return allAnswers;
  }

  void saveList(List<int> scoreList, String key) {
    CasheHelper.setIntList(key, scoreList);
  }

  List<int> getList({required String key}) {
    List<int>? myList = CasheHelper.getIntList(key);
    return myList;
  }

  bool constrians(int level) {
    List<int> myList = getList(key: "scoreList");
    if (myList.isNotEmpty) {
      if (myList[level] >= 5) {
        print(myList);
        print(level);
        return true;
      } else {
        print('it is less than 5');
        return false;
      }
    } else {
      print('it is null');
      return false;
    }
  }

  Future<void> getQuestions() async {
    emit(GetQuestionsLoading());
    print('Loaded');
    var result = await quizRepo.getQuestions();
    result.fold((l) => {print('fail'), emit(GetQuestionsFauilar(l))},
        (r) => {print('succ'), emit(GetQuestionsSuccess(r))});
  }
}
