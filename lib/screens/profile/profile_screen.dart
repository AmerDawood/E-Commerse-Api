import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:softagi_api/constanse/const_color.dart';
import 'package:softagi_api/model/profile_model.dart';
import 'package:softagi_api/prefs/user_pref_controller.dart';
import 'package:softagi_api/screens/app_screen.dart';
import 'package:softagi_api/widgets/custom_text.dart';

import '../../network/api/profile_api_controller.dart';
import '../../utils/helpers.dart';
import '../../widgets/listtile_profile_screen.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with Helpers {

  late Future<UserData> _future;

   late TextEditingController nameEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;
  late TextEditingController phoneEditingController;
  late TextEditingController imageEditingController;

  

  


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

 _future =ProfileApiController().getUserData();
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
      
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: context.theme.primaryColor,
        elevation: 0,
        title: Text('Your Profile',style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.w400),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back,),onPressed: (){

          Navigator.push(context, MaterialPageRoute(builder:(context) {
            return AppScreen();
          },));
        },),

      ),
            body:  FutureBuilder<UserData>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Align(
                      alignment: AlignmentDirectional.topStart,
                      child: SingleChildScrollView(
                        child: Column(



                          children:
                          [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                    child: Column(
                              children: [
                             Center(
                               child: Row(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   Container(
                                     decoration: BoxDecoration(
                                       boxShadow: [
                                       // BoxShadow( blurRadius: 15),

                                       ],
                                       border: Border.all(color: Colors.grey),
                                       borderRadius: BorderRadius.circular(60),
                                     ),
                                     child: CircleAvatar(
                                      //  backgroundColor: Colors.blue,

                                       radius: 50,
                                       backgroundImage:NetworkImage(snapshot.data!.image.toString()),
                                       child: Container(

                                       ),

                                     ),
                                   ),
                                 ],
                               ),


                             ),
                             Column(
                               children: [
                                 SizedBox(height: 30,),
                                         ListTileProfileWidget(icon: Icon(Icons.person), controller: nameEditingController),
                                 SizedBox(height: 10,),


                                         ListTileProfileWidget(icon: Icon(Icons.email), controller: emailEditingController),
                                 SizedBox(height: 10,),

                                         ListTileProfileWidget(icon: Icon(Icons.phone), controller: phoneEditingController),
                                 SizedBox(height: 15,),

                                  Container(

                        decoration: BoxDecoration(
                          color: context.theme.splashColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          enabled: false,
                          // controller: controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     width: 0,
                            //     // color: Colors.black.withOpacity(0.1),
                            //   ),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            hintText: snapshot.data!.token.toString(),
                            iconColor: Colors.black,
                            prefixIcon:IconButton(
                              onPressed: (){},
                          icon:Icon(Icons.token),
                            ),
                            suffixIcon: Icon(Icons.copy),

                            labelStyle: TextStyle(
                              fontSize: 20,
                              height: 2,
                            ),
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     width: 0,
                            //     color: Colors.white,
                            //   ),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                          ),
                        ),
                                          ),

                                          Row(
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                              top: 10,
                            ),
                            child: ElevatedButton(onPressed: ()async => await performUpdate(),

                            style: ElevatedButton.styleFrom(
                              primary:primaryColor.withOpacity(0.4)
                            ) , child:const Text('Update Profile')),
                          )
                        ],
                                          ),





                               ],
                             ),
                              ],
                            ),
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