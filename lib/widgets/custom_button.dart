
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
                  primary: Colors.blue.withOpacity(0.1),
                  fixedSize: Size(400, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadowColor: Color.fromARGB(255, 61, 83, 156),
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