import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:softagi_api/controller/api/users_api_controller.dart';
import 'package:softagi_api/screens/reset_password.dart';
import '../utils/helpers.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<VerifyCodeScreen> with Helpers {
  late TextEditingController emailTextController;
  late TextEditingController codeEditingController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailTextController = TextEditingController();
    codeEditingController =TextEditingController();

  }

  // void navigationToRegisterScreen() {
  //   Navigator.pushNamed(context, '/register_screen');
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    emailTextController.dispose();
    codeEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 250, 247, 1),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
                text: 'Verify Code ... ',
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              CustomText(
                text: 'add your email please',
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
                text: 'Email',
                textEditingController: emailTextController,
              ),
              SizedBox(height: 10),
              CustomTextField(
                text: 'Code',
                textEditingController: codeEditingController,
              ),
              ElevatedButton(
                onPressed: () async => await performVerifyCode(),
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



  Future<void> performVerifyCode() async {
    if (checkData()) {
      await verifyCode();
    }
  }

  bool checkData() {
    if (emailTextController.text.isNotEmpty && codeEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> verifyCode() async {
    bool user = await UserAPIController().verifyCode(
      email: emailTextController.text,
      code: codeEditingController.text,
      context: context,
    );
    if(user){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ResetPasswordScreen();
      },));    }else{
      //
    }
  }

}
