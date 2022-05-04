

import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/theme.dart';

class SwitchScreen extends StatefulWidget {  
  @override  
  SwitchClass createState() => new SwitchClass();  
}  
  
class SwitchClass extends State {  
  // bool isSwitched = false;  

  
  // void toggleSwitch(bool value) {  
  
  //   if(isSwitched == false)  
  //   {  
  //     setState(() {  
  //       isSwitched = true;  
  //       ThemeService().switchTheme();
  //     });  
  //   }  
  //   else  
  //   {  
  //     setState(() {  
  //       isSwitched = false;  
  //       ThemeService().switchTheme();

  //     });  
  //   }  
  // }  
  @override  
  Widget build(BuildContext context) {  
    return SwitchButton();  
  }  
}  