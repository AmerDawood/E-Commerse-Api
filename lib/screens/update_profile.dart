
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:softagi_api/controller/api/profile_api_controller.dart';
import 'package:softagi_api/model/profile_model.dart';
import 'package:softagi_api/prefs/user_pref_controller.dart';
import 'package:softagi_api/screens/profile_screen.dart';
import 'package:softagi_api/utils/helpers.dart';
import 'package:softagi_api/widgets/custom_button.dart';

import '../controller/api/complaints_api_controller.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';


class UpdateProfile extends StatefulWidget {
  const UpdateProfile({ Key? key }) : super(key: key);

  @override
  State<UpdateProfile> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<UpdateProfile> with Helpers{
   late TextEditingController nameEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;
  late TextEditingController phoneEditingController;
  late TextEditingController imageEditingController;
  
  late Future<UserData> _future;

  


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameEditingController = TextEditingController();
    emailEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    phoneEditingController = TextEditingController();
    imageEditingController =TextEditingController();
   _future =ProfileApiController().getUserData();
   nameEditingController.text=UserPreferenceController().name;
   emailEditingController.text=UserPreferenceController().email;
   phoneEditingController.text=UserPreferenceController().phone;


  }

  @override
  void dispose() {
    nameEditingController.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
    phoneEditingController.dispose();
    imageEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
      
        iconTheme: IconThemeData(color: Colors.black),
         backgroundColor: context.theme.primaryColor,
        elevation: 0,
      ),
      body: 
      Stack(
        children: [



           Column(
             children: [
               FutureBuilder<UserData>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return 
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child:
           Stack(
             children: [
               Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Update Your Profile',
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  // color: Colors.black,
                  
                ),
                CustomText(
                  text: 'please enter required data ...',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  // color: Colors.black,
                ),
                SizedBox(
                  height: 20,
                ),
              
            
              CustomTextField(
                  
                  text: 'Name',
                  textEditingController: nameEditingController,
                  
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  
                  text: 'Email',
                  textEditingController: emailEditingController,
                  
                ),
                SizedBox(height: 10),
               
                CustomTextField(
                  text: 'Phone Number',
                  textEditingController: phoneEditingController,
                ),
                  
                SizedBox(height: 10),
           
              
           
               
                SizedBox(
                  height: 20,
                ),
                
               
              ],
                     ),

                     
             ],
           ),
        ),
      );
                    
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                 return Center(child: const SpinKitRotatingCircle(
                            color: Colors.blue,
                            size: 50.0,
                          ),);
                },
              ),
           ],),

          Positioned( 
                bottom:0,
                child: CustomButton(text: 'Update Profile', function: ()async=>await performUpdate(),),),
      ],)
    
      
     
    );
  }

  Future<void> performUpdate() async{
  //  if(checkData()){
    await updateProfile();
  //  } 
  }

  Future<void> updateProfile() async {
    bool status = await ProfileApiController().updateProfile(
      name: nameEditingController.text,
      email: emailEditingController.text,
      password: passwordEditingController.text,
      phone: phoneEditingController.text,
      image:imageEditingController.text,
      context: context,
      
    );
  }

}


/*

  
     
*/