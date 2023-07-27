import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class  CasheHelper {
  static SharedPreferences? sharedPreferences ;

  static init() async{
    sharedPreferences =await SharedPreferences.getInstance();
  }

  Future<bool> putData({
  required String key,
  required int value,
})async{
    return await
    sharedPreferences!.setInt(key, value);
  }


  static int getData({
    required String key,
    required int value,
  }){

    return sharedPreferences!.getInt(key)!;
  }

}