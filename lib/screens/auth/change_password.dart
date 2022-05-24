import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi_api/screens/home_sceen.dart';
import 'package:softagi_api/widgets/custom_button.dart';
import 'package:softagi_api/widgets/custom_text.dart';

import '../../controller/api/profile_api_controller.dart';
import '../../widgets/custom_text_field.dart';
import 'Sign_with_social.dart';
import '../other_screens/faqs_screen.dart';


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
      // backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      extendBodyBehindAppBar: true,
      body:
      
       Stack(

         children:[

           Column(
             children: [
               
               Padding(
                 padding: const EdgeInsets.only(top: 35,left: 10),
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
                        return HomeScreen();
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
                 
                 CustomText(text: 'New Password', fontSize: 30, fontWeight:FontWeight.bold),
                 
               ],
           ),
             ),
           SizedBox(height: 6,),
        
             ],
           ),

          
         Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children:[
            
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: TextFormField(
                      controller: newPasswordEditingController,
                      decoration: const InputDecoration(
                        
                        
                        labelText: 'Current Password',
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
                    padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                          child: TextFormField(
                            controller: currentPasswordEditingController,
                            decoration: const InputDecoration(
                              
                              
                              labelText: 'New Password',
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
                   

         


        
       
            
             ],
           ),
         ),
          


          Column(
            children: [
              SizedBox(height: 670,),
              Padding(
         padding: const EdgeInsets.only(left: 15,right: 15),
         child: Column(
           children: [
             Text(
           'Blease write your new password',
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
             color: Colors.transparent,
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
            child:CustomButton(
              text: 'Change Password', 
            function: ()=>performChangePassword(),

            
            ),
          ),


     
         ]
        
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