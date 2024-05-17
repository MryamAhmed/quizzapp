class QuestionModel {
  String question;
  String correctAnswer;
  List<dynamic> incorrectAnswers;
  int? id;

  QuestionModel(
      {required this.question,
      required this.correctAnswer,
      required this.incorrectAnswers,
      this.id});

  factory QuestionModel.fromJson(jsonData) {
    return QuestionModel(
      question: jsonData['question'],
      correctAnswer: jsonData['correct_answer'],
      incorrectAnswers: jsonData['incorrect_answers'],
    );
  }
}
