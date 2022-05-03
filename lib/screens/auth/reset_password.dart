import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:softagi_api/controller/api/users_api_controller.dart';
import '../../utils/helpers.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<ResetPasswordScreen> with Helpers {
  late TextEditingController emailTextController;
  late TextEditingController codeEditingController;
  late TextEditingController passwordEditingController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailTextController = TextEditingController();
    codeEditingController =TextEditingController();
    passwordEditingController =TextEditingController();

  }

  // void navigationToRegisterScreen() {
  //   Navigator.pushNamed(context, '/register_screen');
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    emailTextController.dispose();
    codeEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 250, 247, 1),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),

        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Reset Password ... ',
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              CustomText(
                text: 'enter required data please',
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                text: 'Email',
                textEditingController: emailTextController,
              ),


              SizedBox(height: 10),
              CustomTextField(
                text: 'Code',
                textEditingController: codeEditingController,
              ),
              SizedBox(height: 10),
              CustomTextField(
                text: 'Password',
                textEditingController: passwordEditingController,
              ),
              ElevatedButton(
                onPressed: () async => await performResetPassword(),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 53, 88, 139),
                  fixedSize: Size(400, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadowColor: Color.fromARGB(255, 61, 83, 156),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }



  Future<void> performResetPassword() async {
    if (checkData()) {
      await resetPassword();
    }
  }

  bool checkData() {
    if (emailTextController.text.isNotEmpty && codeEditingController.text.isNotEmpty && passwordEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> resetPassword() async {
    bool user = await UserAPIController().resetPassword(
      email: emailTextController.text,
      code: codeEditingController.text,
      password: passwordEditingController.text,
      context: context,
    );
    if(user){
      Navigator.pushReplacementNamed(context, '/login_screen');
          }else{
    }
  }

}
