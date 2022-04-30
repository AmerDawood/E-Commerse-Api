import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
 final String text;
 final double fontSize;
 final FontWeight fontWeight;
 final Color color;


 CustomText({
   required this.text,
   required this.fontSize,
   required this.fontWeight,
   required this.color,
});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize:fontSize,
        fontWeight: fontWeight,
        color:color,
      ),
    );
  }
}