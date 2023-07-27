import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({required this.text,this.ontap,@required this.width=double.infinity,@required this.height=50}) ;
  String  text;
  VoidCallback?ontap;
  double? width;
  double? height;
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
            color: Color(0xff6744FF),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Text(text,style: TextStyle(color:Colors.white),)),
        ),
      ),
    );
  }
}
