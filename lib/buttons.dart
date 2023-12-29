import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget{
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  Mybutton({this.color,this.textColor,required this.buttonText,this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:buttonTapped ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(buttonText,style: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: 25),),
            ),

          ),
        ),
      ),
    );
  }

}