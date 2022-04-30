import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {


  final TextEditingController textEditingController;
  final String text;
  CustomTextField({
    required this.textEditingController,
    required this.text,
});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.shade500,
          ),
        ),
        labelText: text,
        labelStyle: TextStyle(
          fontSize: 20,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}