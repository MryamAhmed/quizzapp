import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api{
  Future<dynamic> get({
    required String url,

    @required String? token}) async {

    http.Response response =await http.get(
        Uri.parse(url), );

    if(response.statusCode ==200) {
      //Map<dynamic,dynamic> test = jsonDecode(response.body);
      print('every think is ok from api file');
      //return test;
      return jsonDecode(response.body);
    }else
    {
      throw Exception("ther is a problem with status code ${response.statusCode}");
    }
  }
}