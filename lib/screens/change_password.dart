import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi_api/widgets/custom_button.dart';
import 'package:softagi_api/widgets/custom_text.dart';

import '../controller/api/profile_api_controller.dart';
import '../widgets/custom_text_field.dart';


class ChangePassword extends StatefulWidget {
 
 

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}


class _ChangePasswordState extends State<ChangePassword> {
  late TextEditingController currentPasswordEditingController;
 late TextEditingController newPasswordEditingController;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPasswordEditingController =TextEditingController();
    newPasswordEditingController =TextEditingController();

  }


  @override
  void dispose() {
    newPasswordEditingController.dispose();
    currentPasswordEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
      
        iconTheme: IconThemeData(color: Colors.black),
         backgroundColor: context.theme.splashColor,
        elevation: 0,
      ),


      body: Stack(
        children: [

         Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
                CustomTextField(
                    text: 'Current Password',
                    textEditingController: currentPasswordEditingController,
                    
                  ),
                  SizedBox(height: 10,),
                    CustomTextField(
                    text: 'New Password',
                    textEditingController: newPasswordEditingController,
                    
                  ),
             ],
           ),
         ),

        Positioned(
          bottom: 0,
          child: CustomButton(text: 'Change Password', function: ()async =>await performChangePassword(),)),
      ],
      ),
      
    );
  }

    Future<void> performChangePassword() async{
    await ChangePassword();

  }

  Future<void> ChangePassword() async {
    bool status = await ProfileApiController().changePassword(
current_password: currentPasswordEditingController.text,
new_password: newPasswordEditingController.text,
      context: context,
      
    );
  }
}