
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final Function function;

  CustomButton({required this.text,required this.function});
  

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
                onPressed: () {
                  function();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(400, 60),
                
                  // shadowColor: Color.fromRGBO(151,117,250,1),
                  primary:Color.fromRGBO(151, 117, 250, 1),
                ),
                child: Text(
                 text,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              );
  }
}