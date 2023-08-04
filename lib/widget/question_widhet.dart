import 'package:flutter/material.dart';
import 'package:quizzles/cubits/quizz/quiz_cubit.dart';

class Choice_questions extends StatefulWidget {
  Choice_questions({Key? key, required
  this.isSelected,
    required this.choice,
    required this.number,
  }) : super(key: key);

  final bool isSelected;
  final String choice;
  final String number;

  @override
  State<Choice_questions> createState() => _Choice_questionsState();
}

class _Choice_questionsState extends State<Choice_questions> {
  int scoreCounter = 0;

  @override
  Widget build(BuildContext context) {
    return widget.isSelected
        ?
    Container(
      decoration: BoxDecoration(
        color: Color(0xff35E9BA),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: Color(0xff826DD6),
              radius: 10,
              child: Text(
                widget.number,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              widget.choice,
              style: const TextStyle(
                  color: Colors.black),),
          ),
        ],
      ),
    )
        :
    Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundColor: Color(0xff826DD6),
            radius: 10,
            child: Text(
              widget.number,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            widget.choice,
            style: const TextStyle(
                color: Colors.white),),
        )
      ],
    );
  }
}


class ChoiceQuestionsListView extends StatefulWidget {
  ChoiceQuestionsListView(
      {Key? key, required this.incorrectAnswersList, required this.correctAnswer,required this.questionId,required this.level })
      : super(key: key);

  List<dynamic> incorrectAnswersList;
  String correctAnswer;
  int questionId;
  int level;

  @override
  State<ChoiceQuestionsListView> createState() =>
      _ChoiceQuestionsListViewState();
}

class _ChoiceQuestionsListViewState extends State<ChoiceQuestionsListView> {
  int currentIndex = 0;
  List<dynamic> numbers = [ 'a', 'b', 'c', 'd'];
  List<dynamic> allAnswers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var quizCubit = QuizCubit.get(context) ;

    allAnswers=quizCubit.MakeACombleteList(correcrAnswer: widget.correctAnswer,incorrectAnswersList: widget. incorrectAnswersList);
  }

  @override
  Widget build(BuildContext context) {
    var quizCubit = QuizCubit.get(context) ;

    return ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  setState(() {
                  });
                  quizCubit.CountScore(correcrAnswer: widget.correctAnswer ,
                    choisenAnswer: allAnswers[currentIndex],
                    id: widget.questionId,
                  levelNumber: widget.level);
                },
                child: Choice_questions(
                  isSelected: currentIndex == index,
                  choice: allAnswers[index],
                  number: numbers[index],
                )
            ),

          );
        },);

  }
}


//https://opentdb.com/api_config.php