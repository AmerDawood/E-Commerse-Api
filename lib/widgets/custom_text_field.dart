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
    return  Padding(
                    padding:  EdgeInsets.only(left: 15,right: 15,bottom: 15),
                          child: TextFormField(
                            controller: textEditingController,
                            decoration: InputDecoration(
                              
                              
                              labelText: text,
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 23,
                              ),
                              
                              enabledBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: Colors.grey),
                                
                              ),
         
         focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  
         ),
         
                              
                            ),
                            
                            
                          ),
                        );
  }
}