import 'package:flutter/material.dart';
import 'package:quizzles/pages/score_screen.dart';
import '../constant.dart';
import '../models/question_model.dart';
import '../services/get.dart';
import '../widget/button.dart';
import '../widget/custom_question.dart';


class QuestionScreen extends StatelessWidget {
   const QuestionScreen({Key? key,required this.levelNumber }) : super(key: key);

  final int levelNumber ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title:  Center(
          child: Text(
            'Level ${levelNumber+1}',
            style: const TextStyle(
                color: Color(0xFF46BDAD)),),
        ),
        backgroundColor: const Color(0xff29155C),
      ),

      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:[

            Container(
              height: MediaQuery.of(context).size.height *.79,
              child: FutureBuilder<dynamic>(
                future: QuestionService().getQuestions(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    Map<dynamic,dynamic> x= snapshot.data!;
                    List<dynamic> questionList = x['results'];

                    return
                        Expanded(
                          child: ListView.builder(
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Button(
                icon: Icons.done,
                text: 'Done',
                fontSize: 20,
                ontap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScoreScreen(level: levelNumber,)),
                  );
                  },
              ),
            )
          ]
        ),
      ),
    );
  }
}

