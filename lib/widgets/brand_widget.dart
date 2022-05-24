import 'package:flutter/material.dart';
import 'package:softagi_api/constanse/const_color.dart';

class BrandWidget extends StatelessWidget {
  final String text;
  BrandWidget({
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 120,
                        height: 40,
                        child: Center(child: Text(text,style: TextStyle(letterSpacing: 2),),),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.1),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    );
  }
}