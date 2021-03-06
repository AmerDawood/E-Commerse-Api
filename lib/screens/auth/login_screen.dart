import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:softagi_api/screens/auth/Sign_with_social.dart';
import 'package:softagi_api/screens/auth/send_code_screen.dart';
import 'package:softagi_api/widgets/custom_button.dart';
import '../../network/api/users_api_controller.dart';
import '../../utils/helpers.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/theme_widget.dart';
import '../other_screens/faqs_screen.dart';

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
      extendBodyBehindAppBar: true,
      body:
      
       Stack(

         children:[

           Column(
             children: [
               
               Padding(
                 padding: const EdgeInsets.only(top: 45,left: 10),
                 child: Align(
                   alignment: AlignmentDirectional.topStart,
                   child: 
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius:BorderRadius.circular(60),
                    ),
                    child:  IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                        return SignWithSocial();
                      },)
                      );
                    }, icon:const Icon(Icons.arrow_back,)),
                  ),
                   ),
               ),

            
             Padding(
               padding: const EdgeInsets.only(top:10),
               child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 
                 CustomText(text: 'Welcome', fontSize: 30, fontWeight:FontWeight.bold),
                 
               ],
           ),
             ),
           SizedBox(height: 6,),
            Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               CustomText(
                 text: 'Please enter your data to continue',
                  fontSize: 18, 
                  fontWeight:FontWeight.bold,
                  color: Color.fromRGBO(143, 149, 158, 1),
                  ),
             
             ],
           ),
             ],
           ),

          
         Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children:[

               Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                 child: CustomTextField(textEditingController: emailTextController,text: 'Email',),
               ),
        SizedBox(
                              height:20,
                            ),

               Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                 child: CustomTextField(textEditingController: passwordTextController,text: 'Password',),
               ),

                SizedBox(height: 10,),


                       Padding(
                         padding: const EdgeInsets.only(right:10),
                         child: Row(
             children: [
               Spacer(),
               InkWell(
                 onTap: (){
                   Navigator.push(context,MaterialPageRoute(builder:(context) {
                     return SendCodeScreen();
                   },));
                 },
                 child: CustomText(text: 'Forget Password ? ',color: Colors.red, fontSize: 18, fontWeight: FontWeight.normal)),
             ],
           ),
                       ),
          

           Padding(
             padding: const EdgeInsets.only(top: 20,left: 20,right:15),
             child: Row(
               children: [
                 CustomText(text: 'Remember me ', fontSize:18, fontWeight:FontWeight.normal),
                 Spacer(),
                 SwitchButtonFlutter(),
               ],
             ),
           ),

             ],
           ),
         ),

          Column(
            children: [
              SizedBox(height: 640,),
              Padding(
         padding: const EdgeInsets.only(left: 15,right: 15),
         child: Column(
           children: [
             Text(
           'By connecting your account confirm that you agree ',
            textAlign: TextAlign.center,
     
           style: TextStyle(
             height: 1.5,
             fontSize: 16,
           ),
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             
               Text(
           'with our',
            textAlign: TextAlign.center,
           style: TextStyle(
             height: 1.5,
             fontSize: 16,
           ),
         ),
             InkWell(

               onTap: (){
                 Get.to(FaqsScreen());
               },
               child:Text(
                        ' Term and Condition',
                         textAlign: TextAlign.center,
                        style: TextStyle(
               fontWeight: FontWeight.bold,
               height: 1.5,
               fontSize: 17,
                        ),
                      ),
             ),
           ],
         ),


 
           ],
         ),
       ),
            ],
          ),

          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child:CustomButton(
              text: 'Login', 
            function: ()=>performLogin(),
            ),
          ),


     
         ]
        
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
