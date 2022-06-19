import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {


  final TextEditingController textEditingController;
  final  String text;
  CustomTextField({
    required this.textEditingController,
    required this.text,
});
  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
        // color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: textEditingController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey.shade100,
            ),
          ),
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 19,
          ),
          labelStyle: TextStyle(
            fontSize: 20,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey.shade100,
            ),
          ),
        ),
      ),
    );
  }
}