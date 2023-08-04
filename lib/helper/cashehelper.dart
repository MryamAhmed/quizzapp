import 'package:shared_preferences/shared_preferences.dart';

class  CasheHelper {
  static SharedPreferences? sharedPreferences ;

  static init() async{
    sharedPreferences =await SharedPreferences.getInstance();
  }

  Future<bool> putData({
  required String key,
  required int level1,
    required int level2,
    required int level3,
  })async{
    return await
    sharedPreferences!.setInt(key, level1);
  }


  static int getData({
    required String key,
    required int value,
  }){

    return sharedPreferences!.getInt(key)!;
  }

}