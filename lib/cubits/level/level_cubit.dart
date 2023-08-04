import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'level_state.dart';


class LevelCubit extends Cubit<LevelState> {
  LevelCubit() : super(LevelInitial());

  static LevelCubit get (context ){
    return BlocProvider.of(context);
  }

  int starsNumber=0;
  void handleStars({required int levelScore}){
    if(levelScore == 0 ){
      starsNumber=0;
    }
    else if(levelScore <= 3 && levelScore > 0){
      starsNumber=1;
    }else if (levelScore <= 6 && levelScore >3){
      starsNumber=2;
    }else if(levelScore <=9 && levelScore >6){
      starsNumber=3;
    }
  }
}
