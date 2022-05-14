import 'package:flutter/material.dart';
import 'package:softagi_api/controller/api/users_api_controller.dart';
import 'package:softagi_api/prefs/user_pref_controller.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);


  @override
  
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      String routeName =UserPreferenceController().loggedIn?'/app_screen':'/login_screen';
      Navigator.pushReplacementNamed(context, routeName);
    });
  }
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(150, 124, 250, 2000),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('LAZE',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
          ),
        ],
      ),
    );
  }
}