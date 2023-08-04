import 'package:flutter/material.dart';

import '../cubits/quizz/quiz_cubit.dart';

class CustomResult extends StatelessWidget {
   CustomResult({Key? key,required this.score}) : super(key: key);

  int score;
  @override
  Widget build(BuildContext context) {
    var quizCubit = QuizCubit.get(context) ;
    return Container(
      width: double.infinity,
      height: 430,
      decoration: BoxDecoration(
          color: const Color(0xff6B50DB),
          borderRadius: BorderRadius.circular(30)
      ),
      child:  Column(
        children: [
          Spacer(),
          const Padding(
            padding: EdgeInsets.only(top: 50,bottom: 24),
            child: Text(
              'Your final score is ',
              style: TextStyle(color: Colors.white,fontSize: 33,fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          CircleAvatar(
            radius: 95,
            backgroundColor: Color(0xffF8C727),
            child: Text(
              score.toString(),
              style: TextStyle(color: Colors.white,fontSize: 65,fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
        ],
      ),
    );
    quizCubit.scoreCounter=0;
  }
}
