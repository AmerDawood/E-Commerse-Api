import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:softagi_api/controller/api/users_api_controller.dart';
import 'package:softagi_api/widgets/custom_button.dart';
import '../../utils/helpers.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<LoginScreen> with Helpers {
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer.onTap = navigationToRegisterScreen;
  }

  void navigationToRegisterScreen() {
    Navigator.pushNamed(context, '/register_screen');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailTextController.dispose();
    passwordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(254, 250, 247, 1),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          
         Padding(
           padding: const EdgeInsets.all(15.0),
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
                text: 'Login Screen ... ',
                fontSize: 30,
                fontWeight: FontWeight.w600,
                // color: Colors.black,
              ),
              CustomText(
                text: 'First login your account.',
                fontSize: 20,
                fontWeight: FontWeight.normal,
                // color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                text: 'Email',
                textEditingController: emailTextController,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                text: 'Password',
                textEditingController: passwordTextController,
              ),
              SizedBox(height: 10),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account ?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: ' Register Now',
                        recognizer: _tapGestureRecognizer,
                        style: TextStyle(
                          color: Color.fromARGB(255, 53, 88, 139),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/send_code');
                  },
                  child: CustomText(
                    text: 'Forget Password ?',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 53, 88, 139),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomButton(
                function: ()async =>await performLogin(),
                text: 'Get Started',
              ),
              SizedBox(
                height: 20,
              ),
            ],
        ),
         ),
        // CustomButton(text: 'Login Now', function: ()async => await performLogin()),
        ],
        
      ),
    );
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (emailTextController.text.isNotEmpty &&
        passwordTextController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> login() async {
    bool user = await UserAPIController().login(
      email: emailTextController.text,
      password: passwordTextController.text,
      context: context,
    );
    if(user){
    Navigator.pushReplacementNamed(context, '/app_screen');
  }else{
    //
  }
  }
 
}
