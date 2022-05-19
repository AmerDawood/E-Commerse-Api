import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:softagi_api/controller/api/users_api_controller.dart';
import 'package:softagi_api/prefs/user_pref_controller.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);


  @override
  
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      String routeName =UserPreferenceController().loggedIn?'/app_screen':'/manOrWoman';
      Navigator.pushReplacementNamed(context, routeName);
    });
  }
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(151, 117, 250, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Center(
            child:SvgPicture.asset('images/Logo.svg'),
          ),
        ],
      ),
    );
  }
}