import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
class AboutAndTerms extends StatelessWidget {

  final String title;
  final String details;

AboutAndTerms({
  required this.details,
  required this.title,
});
  @override
  Widget build(BuildContext context) {
    return Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                        child: ExpandablePanel(
                          
                          
      header:Column(children: [
         Align(
           alignment: AlignmentDirectional.topStart,
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(title,
             style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.w500,
             ),
             ),
           ),
         ),
         Divider(),
      ],),
      collapsed: Text('', softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),

      expanded: Align(
        alignment: AlignmentDirectional.center,
        child: Text(details,
        style: TextStyle(
          fontSize: 18,
        ),
         softWrap: true,),
      ),
      theme: ExpandableThemeData(
        hasIcon: true,
        iconColor: Colors.blue,
        animationDuration: Duration(seconds: 1),
        iconSize: 30,
        
        
      ),
      
    ),
     );
  }
}
