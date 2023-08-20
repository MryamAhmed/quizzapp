import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../widget/levels.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Levels',
            style: TextStyle(
                color: Color(0xFF46BDAD)),),
        ),
        backgroundColor: Color(0xff29155C),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: LevelCard(index),
              );
              },
        ),
      )
    );
  }
}
