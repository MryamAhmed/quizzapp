import '../helper/api.dart';
import '../models/question_model.dart';

class QuestionService{
  Future<dynamic> getQuestions() async{
    print('hiiiiiiiiii');

   Map<dynamic,dynamic> data = await Api().get(url:'https://opentdb.com/api.php?amount=16');


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