import 'package:flutter/material.dart';
import 'package:quizzles/feature/quiz/presentation/views/widget/question_widget.dart';

import '../../../data/models/question_model.dart';

class CustomQuestion extends StatelessWidget {
  CustomQuestion({Key? key, required this.questionModel, required this.level})
      : super(key: key);
  QuestionModel questionModel;

  int level;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, right: 16, left: 16, top: 10),
      child: SizedBox(
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text('- ${questionModel.question}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              //child: Text('dd'),
              child: ChoiceQuestionsListView(
                level: level,
                questionId: questionModel.id ?? 1,
                correctAnswer: questionModel.correctAnswer,
                incorrectAnswersList: questionModel.incorrectAnswers,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
