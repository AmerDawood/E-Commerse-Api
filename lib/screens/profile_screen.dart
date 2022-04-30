import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:softagi_api/controller/api/profile_api_controller.dart';
import 'package:softagi_api/model/profile_model.dart';
import 'package:softagi_api/prefs/user_pref_controller.dart';
import 'package:softagi_api/screens/app_screen.dart';
import 'package:softagi_api/widgets/custom_text.dart';

import '../widgets/listtile_profile_screen.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late Future<UserData> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future =ProfileApiController().getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Your Profile',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w400),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){

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
                 BoxShadow(color: Colors.blue.withOpacity(0.2), blurRadius: 15),
                
                 ],
                 border: Border.all(color: Colors.blue.withOpacity(0.1),),
                 borderRadius: BorderRadius.circular(60),
               ),
               child: CircleAvatar(
                 backgroundColor: Colors.blue,
                 
                 radius: 50,
                 backgroundImage:NetworkImage(snapshot.data!.image.toString()),
                 child: Container(
                   
                 ),
                 
               ),
             ),
           ],
         ),

         
       ),
         SizedBox(height: 15,),
       Column(
         children: [
        ListTileProfileWidget(icon: Icon(Icons.person,color: Colors.blue,),text:snapshot.data!.name.toString()),
         SizedBox(height: 15,),
        ListTileProfileWidget(icon: Icon(Icons.email,color: Colors.blue,),text:snapshot.data!.email.toString()),
         SizedBox(height: 15,),  
        ListTileProfileWidget(icon: Icon(Icons.phone,color: Colors.blue,),text:snapshot.data!.phone.toString()),
  SizedBox(height: 15,), 
         Row(
           children: [
             Expanded(
               flex: 4,
               child: ListTileProfileWidget(icon: Icon(Icons.token,color: Colors.blue,),text:snapshot.data!.token.toString())),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Expanded(
                child: ElevatedButton(
                  
          onPressed: (){
          final data = ClipboardData(text: 'test');
          Clipboard.setData(data);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shadowColor: Colors.blue,
        ),
        
         child:Icon(Icons.copy,color: Colors.blue,),
         ),
              ),
            ),
        
           ],
         ),
         
         ],
       ),  
        ],
      ),
            ),
   
                        ],
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
}