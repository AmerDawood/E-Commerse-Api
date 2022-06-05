import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:softagi_api/screens/auth/verify_code_screen.dart';
import '../../network/api/users_api_controller.dart';
import '../../utils/helpers.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class SendCodeScreen extends StatefulWidget {
  const SendCodeScreen({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SendCodeScreen> with Helpers {
  late TextEditingController emailTextController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailTextController = TextEditingController();

  }

  // void navigationToRegisterScreen() {
  //   Navigator.pushNamed(context, '/register_screen');
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    emailTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.arrow_back,) ,onPressed: (){
          Navigator.pushReplacementNamed(context, '/login_screen');
        },),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            

            ]
          ),
        ),
      ),
    );
  }

  Future<void> performVerify() async {
    if (checkData()) {
      await verify();
    }
  }

  bool checkData() {
    if (emailTextController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> verify() async {
    bool user = await UserAPIController().verifyEmail(
      email: emailTextController.text,
      context: context,
    );
    if(user){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return VerifyCodeScreen();
      },));
    }else{
      //
    }
  }

}
