import 'package:flutter/material.dart';
import '../cubits/quizz/quiz_cubit.dart';

class CustomResult extends StatelessWidget {
   CustomResult({Key? key,required this.score}) : super(key: key);

  int score;
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 430,
      decoration: BoxDecoration(
          color: const Color(0xff6B50DB),
          borderRadius: BorderRadius.circular(30)
      ),
      child:  Column(
        children: [
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(top: 50,bottom: 24),
            child: Text(
              'Your final score is ',
              style: TextStyle(color: Colors.white,fontSize: 33,fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          CircleAvatar(
            radius: 95,
            backgroundColor: const Color(0xffF8C727),
            child: Text(
              score.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 65,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
