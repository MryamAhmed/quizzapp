import 'package:flutter/material.dart';
import 'package:quizzles/pages/score_screen.dart';
import '../constant.dart';
import '../models/question_model.dart';
import '../services/get.dart';
import '../widget/button.dart';
import '../widget/custom_question.dart';
import 'levels_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzles/cubits/quizz/quiz_cubit.dart';


class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Levels',
            style: TextStyle(
                color: Color(0xFF46BDAD)),),
        ),
        backgroundColor: Color(0xff29155C),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:[ FutureBuilder<dynamic>(
              future: QuestionService().getQuestions(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  print('done');
                  //List<QuestionModel> questionList = snapshot.data!; // ask????
                  Map<dynamic,dynamic> x= snapshot.data!;
                  List<dynamic> questionList = x['results'];
                  List<dynamic> allAnswers = [];
                  print(questionList.length);
                  return Expanded(
                    child: BlocListener<QuizCubit, QuizState>(
                      listener: (context, state) {
                        if(state is QuizInitial){
                          allAnswers = BlocProvider.of<QuizCubit>(context).MakeACombleteList(correcrAnswer: correctAnswer,
                              incorrectAnswersList: incorrectAnswersList);
                        }
                      },
                      child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return CustomQuestion(
                                questionModel: QuestionModel(
                                  question: questionList[index]['question'],
                                  correct_answer: questionList[index]['correct_answer'],
                                  incorrect_answers: questionList[index]['incorrect_answers'],
                                ),
                                length: questionList.length );
                          }),
                    ),
                  );
                }
                else{
                  print('errror');
                  return Center(
                      child: CircularProgressIndicator());
                }

              }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Button(
                    text: 'previous',
                    width: 120,
                    height: 40,
                    ontap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LevelsScreen()),
                      );
                    },
                  ),
                  Spacer(),
                  Button(
                    text: 'next',
                    width: 120,
                    height: 40,
                    ontap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScoreScreen()),
                      );
                    },
                  )
                ],
              ),
            ),
        ]),
      ),
    );
  }
}

