
import 'package:flutter/material.dart';

class CustomResult extends StatelessWidget {
   CustomResult({Key? key,required this.score}) : super(key: key);

  int score;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          color: const Color(0xff6B49FF),
          borderRadius: BorderRadius.circular(30)
      ),
      child: const Column(
        children: [
          Spacer(),
          Padding(
            padding: EdgeInsets.only(top: 50,bottom: 24),
            child: Text(
              'Your final score is ',
              style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Color(0xffF7C431),
              child: Text(
                '60',
                style: TextStyle(color: Colors.white,fontSize: 65,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
