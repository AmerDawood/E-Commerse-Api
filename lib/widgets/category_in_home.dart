import 'package:flutter/material.dart';


class StackToCategory extends StatelessWidget {

  final String title;
  final String imageUrl;
  StackToCategory({
    required this.title,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                        height:70,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child:Image.network(imageUrl,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}