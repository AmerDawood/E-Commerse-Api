import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi_api/screens/auth/Sign_with_social.dart';
import 'package:softagi_api/screens/auth/login_screen.dart';
import 'package:softagi_api/utils/helpers.dart';

import '../../network/api/users_api_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/theme_widget.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  late TextEditingController nameEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;
  late TextEditingController phoneEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameEditingController = TextEditingController();
    emailEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    phoneEditingController = TextEditingController();
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
    phoneEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      
     
      body: 
 
       Column(

         children:[

           Column(
             children: [

               Padding(
                 padding: const EdgeInsets.only(top: 30,left: 10),
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
                      Get.to(SignWithSocial()
                      );
                    }, icon:const Icon(Icons.arrow_back,)),
                  ),
                   ),
               ),


             Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [

               CustomText(text: 'Sign Up', fontSize: 30, fontWeight:FontWeight.bold),

             ],
           ),

             ],
           ),


         Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children:[

                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 10),
                    child: TextFormField(
                      controller: nameEditingController,
                      decoration: const InputDecoration(


                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 23,
                        ),

                        enabledBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.grey),

                        ),

         focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),

         ),


                      ),


                    ),
                  ),
               SizedBox(
                              height:20,
                            ),


                        Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,bottom: 4),
                          child: TextFormField(
                            controller: emailEditingController,
                            decoration: const InputDecoration(


                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 23,
                              ),

                              enabledBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: Colors.grey),

                              ),

         focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),

         ),


                            ),


                          ),
                        ),

              SizedBox(
                              height:20,
                            ),


                        Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,bottom:4),
                          child: TextFormField(
                            controller: passwordEditingController,
                            decoration: const InputDecoration(


                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 23,
                              ),

                              enabledBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: Colors.grey),

                              ),

         focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),

         ),


                            ),


                          ),
                        ),
                        SizedBox(
                              height:20,
                            ),


                        Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,bottom: 4),
                          child: TextFormField(
                            controller: phoneEditingController,
                            decoration: const InputDecoration(


                              labelText: 'Phone',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 23,
                              ),

                              enabledBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: Colors.grey),

                              ),

         focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),

         ),


                            ),


                          ),
                        ),



           Padding(
             padding: const EdgeInsets.only(top: 10,left: 20,right:15),
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



      //  Spacer(),
          Positioned(
            bottom: 0,
            child: CustomButton(
              text: 'Sign Up',
            function: ()=>performRegister(),
            ),
          ),



         ]

       ),
  
    );
  }

  Future<void> performRegister() async{
   if(checkData()){
    await register();
   } 
  }

  bool checkData() {
    if (nameEditingController.text.isNotEmpty &&
        emailEditingController.text.isNotEmpty &&
        passwordEditingController.text.isNotEmpty &&
        phoneEditingController.text.isNotEmpty) {
          return true;
        }else{
          return false;
        }
  }

  Future<void> register() async {
    bool user = await UserAPIController().register(
      name: nameEditingController.text,
      email: emailEditingController.text,
      password: passwordEditingController.text,
      phone: phoneEditingController.text,
      context: context,
    );
  }
}
