import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({required this.text,this.ontap,this.fontSize,this.icon,}) ;
  final String  text;
  final VoidCallback?ontap;
  final double? fontSize;
  final IconData? icon ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: const Color(0xff6B50DB),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,color: Colors.white,),
              const SizedBox(
                  width: 20),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
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
