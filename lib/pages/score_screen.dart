import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../cubits/level/level_cubit.dart';
import '../cubits/quizz/quiz_cubit.dart';
import '../widget/button.dart';
import '../widget/custom_score.dart';
import 'levels_screen.dart';

class ScoreScreen extends StatefulWidget {
   ScoreScreen({Key? key,required this.level}) : super(key: key);
   int level;

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {

  @override
  Widget build(BuildContext context) {
    var quizCubit = QuizCubit.get(context) ;
    int numberOfCorrectQuestions=quizCubit.levelsCountersList[widget.level];
    quizCubit.restartCount();
    return Scaffold(
        backgroundColor: kPrimaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: const Center(
          child:  Text(
            'Results',
            style: TextStyle(
                color: Color(0xFF46BDAD)
            ),
          ),
        ),
        backgroundColor: const Color(0xff29155C),
      ),
      body:  Padding(
        padding:  EdgeInsets.only(bottom: 16,right: 24,left: 24,top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'total correct answer is ',
              style: TextStyle(
                  color: Colors.white),
            ),
            const SizedBox(height: 8,),
             Text(
              '${numberOfCorrectQuestions} out of 9 questions',
              style: const TextStyle(
                  color: Color(0xFF46BDAD)
              ),
            ),
            const SizedBox(height: 5*8,),
            CustomResult(score:numberOfCorrectQuestions),
            const Spacer(),
            Button(
              icon: Icons.arrow_back,
              text: 'Tray Again ',fontSize: 20,
              ontap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LevelsScreen()),
                );
              },

            ),
            const Spacer()
          ],
        ),
      )
    );
  }
}
