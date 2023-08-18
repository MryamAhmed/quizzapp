import 'package:flutter/material.dart';
import 'package:quizzles/widget/question_widget.dart';
import '../models/question_model.dart';

class CustomQuestion extends StatelessWidget {
   CustomQuestion({Key? key,required this.questionModel, required this.length,required this.level}) : super(key: key);
   QuestionModel questionModel;
   dynamic length;
   int level;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 16,right: 16,left: 16,top: 10),
      child: SizedBox(
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                questionModel.question,
                overflow: TextOverflow.ellipsis,

                style: const TextStyle(
                    color: Colors.white)
            ),
            const SizedBox(
              height: 8,
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
