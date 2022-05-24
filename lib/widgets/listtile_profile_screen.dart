

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:softagi_api/constanse/const_color.dart';


class ListTileProfileWidget extends StatelessWidget {
  //  final String text;
   final Icon icon;
   final TextEditingController controller;


   ListTileProfileWidget({
    //  required this.text,
     required this.icon,
     required this.controller,
     });

  @override
  Widget build(BuildContext context) {
    return 
     Container(
      //  height: 70,
       
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        color: context.theme.splashColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: TextField(
                          controller: controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                color: Colors.black.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // hintText: ,
                            iconColor: Colors.black,
                            prefixIcon:IconButton(
                              onPressed: (){},
                          icon:icon,
                            ),
                            suffix: Icon(Icons.edit,color: Colors.grey,),
                            
                            labelStyle: TextStyle(
                              fontSize: 20,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    );
  }
}