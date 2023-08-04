import '../helper/api.dart';
import '../models/question_model.dart';

class QuestionService{
  Future<dynamic> getQuestions() async{
    print('hiiiiiiiiii');

   Map<dynamic,dynamic> data = await Api().get(url:'https://opentdb.com/api.php?amount=15&difficulty=easy&type=multiple');

   //https://opentdb.com/api.php?amount=30&category=27&type=multiple

   //ask????
   //List<QuestionModel> questionList =[] ;
   /*  // why I cant add the data in map in to a list
    for (int i = 0; i < data.length ;i++) {
      questionList.add(data['results'][i]);
           print('this is $questionList');
         }
    */

       print('hii');
       return data;
  }
}