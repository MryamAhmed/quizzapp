import 'package:flutter/material.dart';

import '../constant.dart';
import '../cubits/level/level_cubit.dart';
import '../cubits/quizz/quiz_cubit.dart';
import '../helper/cashehelper.dart';
import '../pages/question_screen.dart';

class LevelCard extends StatefulWidget {
  final int level;

  const LevelCard(this.level);

  @override
  State<LevelCard> createState() => _LevelCardState();
}

class _LevelCardState extends State<LevelCard> {
  bool x = false;

  @override
  void initState() {
    super.initState();
    var levelCubit = LevelCubit.get(context);
    var quizCubit = QuizCubit.get(context);
    levelCubit.handleStars(
        levelScore: CasheHelper.getIntList("scoreList")[widget.level]
    );
  }

  @override
  Widget build(BuildContext context) {
    var quizCubit = QuizCubit.get(context);
    var levelCubit = LevelCubit.get(context);

    if (widget.level == 0) {
      return Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuestionScreen(
                        levelNumber: widget.level,
                      )),
            );
            quizCubit.levelsCountersList[widget.level] =0;
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kLevelsColorList[widget.level],
                ),
                child: Center(
                  child: Text(
                    "Level \n\t\t 0${widget.level + 1}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -30,
                left: 30,
                child: Row(
                  children: [
                    Icon(Icons.star,
                        color: (levelCubit.starsNumber >= 1
                            ? Colors.yellow
                            : Colors.yellow.withOpacity(.5))),
                    Icon(Icons.star,
                        color: (levelCubit.starsNumber >= 2
                            ? Colors.yellow
                            : Colors.yellow.withOpacity(.5))),
                    Icon(Icons.star,
                        color: (levelCubit.starsNumber >= 3
                            ? Colors.yellow
                            : Colors.yellow.withOpacity(.5))),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    else if ( quizCubit.constrians(widget.level-1)) {
      return Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuestionScreen(
                        levelNumber: widget.level,
                      )),
            );
            quizCubit.levelsCountersList[widget.level] =0;
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kLevelsColorList[widget.level],
                ),
                child: Center(
                  child: Text(
                    "Level \n\t\t 0${widget.level + 1}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -30,
                left: 30,
                child: Row(
                  children: [
                    Icon(Icons.star,
                        color: (levelCubit.starsNumber >= 1
                            ? Colors.yellow
                            : Colors.yellow.withOpacity(.5))),
                    Icon(Icons.star,
                        color: (levelCubit.starsNumber >= 2
                            ? Colors.yellow
                            : Colors.yellow.withOpacity(.5))),
                    Icon(Icons.star,
                        color: (levelCubit.starsNumber >= 3
                            ? Colors.yellow
                            : Colors.yellow.withOpacity(.5))),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kLevelsColorList[widget.level],
              ),
              child: Center(
                child: Text(
                  "Level \n\t\t 0${widget.level + 1}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -30,
              left: 30,
              child: Container(
                  child: const Row(
                children: [
                  Icon(Icons.star, color: Colors.grey),
                  Icon(Icons.star, color: Colors.grey),
                  Icon(Icons.star, color: Colors.grey),
                ],
              )),
            ),
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.6),
              ),
              child: const Icon(
                Icons.lock,
                color: Colors.yellow,
                size: 30,
              ),
            ),
          ],
        ),
      );
    }

    /*
      return


    level == 0 || levelsCountersList[0] == 5 ?

    Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuestionScreen(levelNumber: level,)
            ),
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
                  "Level \n\t\t 0${level + 1}",
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
    )
      :
    Center(
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
                "Level \n\t\t 0${level + 1}",
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
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.6),
            ),
            child: const Icon(
              Icons.lock,
              color: Colors.yellow,
              size: 30,
            ),
          ),
        ],
      ),
    );

       */
  }
}
