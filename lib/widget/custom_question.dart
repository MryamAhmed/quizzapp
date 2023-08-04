import 'package:flutter/material.dart';
import 'package:quizzles/widget/question_widhet.dart';
import '../models/question_model.dart';

class CustomQuestion extends StatelessWidget {
   CustomQuestion({Key? key,required this.questionModel, required this.length,required this.level}) : super(key: key);
   QuestionModel questionModel;
   dynamic length;
   int level;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 16,right: 16,left: 16,top: 50),
      child: SizedBox(
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                questionModel.question,
                style: const TextStyle(
                    color: Colors.white)
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: ChoiceQuestionsListView(
                  level: level,
                  questionId: questionModel.id!,
                  correctAnswer: questionModel.correct_answer,
                  incorrectAnswersList: questionModel.incorrect_answers,
                )
            ),
          ],
        ),
      ),
    );
  }
}
