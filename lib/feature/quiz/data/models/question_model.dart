class QuestionModel {
  String question;
  String correct_answer;
  List<dynamic> incorrect_answers;
  int? id;

  QuestionModel({
    required this.question,
    required this.correct_answer,
    required this.incorrect_answers,
     this.id
  });

  factory  QuestionModel.fromJson(jsonData){
    return QuestionModel(
      question: jsonData['question'],
      correct_answer: jsonData['correct_answer'],
      incorrect_answers: jsonData['incorrect_answers'],
    );
  }
}