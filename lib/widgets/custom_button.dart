
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final Function function;

  CustomButton({required this.text,required this.function});
  

  @override
  Widget build(BuildContext context) {
    return   Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child:InkWell(
                    onTap: (){
                    function(){}
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      color: Color.fromARGB(255, 183, 150, 218),
                      child: Center(child: Text(text)),
                    ),
                  ));
  }
}