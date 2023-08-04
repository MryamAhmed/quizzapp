import 'package:flutter/material.dart';
import 'package:quizzles/pages/score_screen.dart';
import '../constant.dart';
import '../models/question_model.dart';
import '../services/get.dart';
import '../widget/button.dart';
import '../widget/custom_question.dart';
import 'levels_screen.dart';
import 'package:quizzles/cubits/quizz/quiz_cubit.dart';

class QuestionScreen extends StatelessWidget {
   QuestionScreen({Key? key,required this.levelNumber}) : super(key: key);

  int levelNumber;
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
          children:[
            FutureBuilder<dynamic>(
              future: QuestionService().getQuestions(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  //List<QuestionModel> questionList = snapshot.data!; // ask????
                  /*
                  List<dynamic> FirstLevelList =[];
                  List<dynamic> SecondLevelList =[];
                  List<dynamic> ThirdLevelHardList =[];
                  List<List<dynamic>> allLevelsList = [];

                   */
                  Map<dynamic,dynamic> x= snapshot.data!;
                  List<dynamic> questionList = x['results'];
                  /*
                  for(int i = 0 ; i<x.length ; i++){
                    if(questionList[i]['difficulty']== 'easy'){
                      questionEsyList.add(questionList[i]);
                    }else if(questionList[i]['difficulty']== 'medium'){
                      questionMediumList.add(questionList[i]);
                    }else{
                      questionHardList.add(questionList[i]);
                    }
              }

                   */
                  /*
                  for(int i =0;i<15;i++){
                    if(i<5){
                      FirstLevelList.add(questionList[i]);
                    }else  if(i<10){
                      SecondLevelList.add(questionList[i]);
                    }
                    else  if(i<15){
                      ThirdLevelHardList.add(questionList[i]);
                    }
                  }

                  allLevelsList.add(FirstLevelList);
                  allLevelsList.add(SecondLevelList);
                  allLevelsList.add(ThirdLevelHardList);

                   */

                  return
                      Expanded(
                        child: ListView.builder(   //Pagina.builder
                          itemCount: 9,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomQuestion(
                                level: levelNumber,
                                  questionModel: QuestionModel(
                                    id: index,
                                    question: questionList[index]['question'],
                                    correct_answer: questionList[index]['correct_answer'],
                                    incorrect_answers: questionList[index]['incorrect_answers'],
                                  ),
                                  length: questionList.length );
                            }),
                      );


                }
                else{
                  print('errror');
                  return const Center(
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
                    MaterialPageRoute(builder: (context) => ScoreScreen(level: levelNumber,)),
                  );
                },
              )
            ],
          ),
        )
        ]

        ),
      ),
    );
  }
}

