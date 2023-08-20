import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setIntList(String key, List<int> valueList) async {
    List<String> stringList = valueList.map((e) => e.toString()).toList();
    sharedPreferences!.setStringList(key, stringList);
  }

  static List<int> getIntList(String key) {
    List<String>? stringList = sharedPreferences?.getStringList(key);
    if (stringList == null) return [0,0,0];
    return stringList.map((e) => int.parse(e)).toList();
  }


}
