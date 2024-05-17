import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzles/feature/quiz/presentation/views/score_screen.dart';
import 'package:quizzles/feature/quiz/presentation/views/widget/custom_question.dart';

import '../../../../constant.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/custome_error_widget.dart';
import '../../data/models/question_model.dart';
import '../manager/quizz/quiz_cubit.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key, required this.levelNumber}) : super(key: key);

  final int levelNumber;

  @override
  Widget build(BuildContext context) {
    final quizCubit = BlocProvider.of<QuizCubit>(context);
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Level ${levelNumber + 1}',
              style: const TextStyle(color: Color(0xFF46BDAD)),
            ),
          ),
          backgroundColor: const Color(0xff29155C),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .79,
              child: BlocBuilder<QuizCubit, QuizState>(
                builder: (context, state) {
                  if (state is GetQuestionsLoading) {
                    print("Inside the Loading state");
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetQuestionsFauilar) {
                    print("Inside the Failure state");
                    return CustomeErrorWidget(
                      errorMessage: state.error,
                    );
                  } else if (state is GetQuestionsSuccess) {
                    List<dynamic> questionList = state.questions;
                    return ListView.builder(
                        itemCount: questionList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomQuestion(
                            level: levelNumber,
                            questionModel: QuestionModel(
                              id: index,
                              question: questionList[index]['question'],
                              correct_answer: questionList[index]
                                  ['correct_answer'],
                              incorrect_answers: questionList[index]
                                  ['incorrect_answers'],
                            ),
                          );
                        });
                  } else {
                    print("Inside the else statement ");
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Button(
                icon: Icons.done,
                text: 'Done',
                fontSize: 20,
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScoreScreen(
                        level: levelNumber,
                      ),
                    ),
                  );
                },
              ),
            )
          ]),
        ));
  }
}
