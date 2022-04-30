

import 'package:flutter/material.dart';


class ListTileProfileWidget extends StatelessWidget {
   final String text;
   final Icon icon;

   ListTileProfileWidget({required this.text,required this.icon});

  @override
  Widget build(BuildContext context) {
    return  Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(color: Colors.blue.withOpacity(0.2), blurRadius: 15),
    ]
  ),
  child: ListTile(
    leading: icon,
    tileColor: Colors.black.withOpacity(0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      side: const BorderSide(
        color: Colors.black,
      ),
    ),
    title:Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontSize: 20,
        color: Colors.blueAccent,
      ),
    ),
    contentPadding:
    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  ),
);
  }
}