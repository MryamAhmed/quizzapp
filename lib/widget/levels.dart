import 'package:flutter/material.dart';

import '../constant.dart';
import '../pages/question_screen.dart';

class LevelCard extends StatelessWidget {
  final int level;


  const LevelCard(this.level);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuestionScreen()),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kLevelsColorList[level],
              ),
              child: Center(
                child: Text(
                  "Level \n\t\t 0${level+1}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
             const Positioned(
              top: -30,
              left: 30,
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}