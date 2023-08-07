import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../widget/button.dart';
import 'levels_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              width: 300,
              height: 300,
            ),
            const Text(
              'Quizzles',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3FBBB7)),
            ),
            const SizedBox(height: 8*4),

            const Text(
              'Let\'s play!',
              style: TextStyle(
                  color: Colors.white,fontWeight :FontWeight.bold)
              ,),
            SizedBox(height: 8),
            const Text(
              'play now and level up',
              style: TextStyle(
                  color: Colors.white),
            ),

            SizedBox(height: 8*7),
            Button(
                text:'Play Now' ,

                ontap:(){ Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LevelsScreen()),
                );},

            ),
            SizedBox(height: 8*3),
            Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  child: Text("About",style: TextStyle(color: Color(0xFF644DC0)),),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    side: BorderSide(
                      color: Color(0xFF352570),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LevelsScreen()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
  }
}
