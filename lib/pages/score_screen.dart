import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../widget/button.dart';
import '../widget/custom_score.dart';
import 'levels_screen.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
      appBar: AppBar(
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
        padding: const EdgeInsets.only(bottom: 16,right: 24,left: 24,top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'total correct answer is ',
              style: TextStyle(
                  color: Colors.white),
            ),
            SizedBox(height: 5,),
            const Text(
              '2 oyt of 3 questions  ',
              style: TextStyle(
                  color: Color(0xFF46BDAD)
              ),
            ),
            CustomResult(score: 60),
            Spacer(),
            Button(
              text: 'play again ',
              ontap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LevelsScreen()),
                );
              },

            ),
            Spacer()
          ],
        ),
      )
    );
  }
}
