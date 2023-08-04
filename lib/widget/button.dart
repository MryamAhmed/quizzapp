import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Button extends StatelessWidget {
  Button({required this.text,this.ontap,@required this.width=double.infinity,@required this.height=50, this.fontSize,this.icon,}) ;
  String  text;
  VoidCallback?ontap;
  double? width;
  double? height;
  double? fontSize;
  IconData? icon ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Color(0xff6B50DB),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,color: Colors.white,),
              SizedBox(width: 20),
              Text(
                text,style: TextStyle(
                  color:Colors.white,fontSize: fontSize
              ),),
              //Icon(FontAwesomeIcons.gamepad),
            ],
          ),
        ),
      ),
    );
  }
}
