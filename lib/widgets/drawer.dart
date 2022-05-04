import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:softagi_api/controller/api/profile_api_controller.dart';
import 'package:softagi_api/model/profile_model.dart';
import 'package:softagi_api/prefs/user_pref_controller.dart';
import 'package:softagi_api/screens/faqs_screen.dart';
import 'package:softagi_api/screens/profile_screen.dart';
import 'package:softagi_api/utils/helpers.dart';
import 'package:softagi_api/widgets/switch_widget.dart';

import '../screens/complaints_screen.dart';
import '../screens/settings_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> with Helpers {
   bool _notificationsState =false;

   late Future<UserData> _future;


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = ProfileApiController().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Align(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon:SvgPicture.asset('images/menu2.svg'),
                  )),


                   FutureBuilder<UserData>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Column(
                        
                    
                       
                        children: 
                           [
          Container(
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                
                child:    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 15),
                       
                        ],
                        border: Border.all(color: Colors.black.withOpacity(0.1),),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade200,
                        
                        radius: 50,
                        backgroundImage:NetworkImage(snapshot.data!.image.toString()),
                        child: Container(
                          
                        ),
                        
                      ),
                    ),
              ),
              title: Text(
               snapshot.data!.name.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(54, 89, 106, 1),
                ),
              ),
              subtitle: Text(
                'ID: ${snapshot.data!.id.toString()}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.green,
                ),
              ),
              trailing: ElevatedButton(
                onPressed: (){},
                child: Text('${snapshot.data!.points.toString()} points'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.withOpacity(0.1),
                ),
              ),
            ),
          ),
         
         
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const SpinKitRotatingCircle(
                            color: Colors.blue,
                            size: 50.0,
                          );
                },
              ),



         
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 20),
                child: Column(
                  
                  children: [
                    
                     ListTile(
                      leading: IconButton(icon: SvgPicture.asset('images/sun.svg'),onPressed: (){},),
                       title: Text('Dark Mood',
                         style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            
                       ),
                       trailing:SizedBox(
                         width: 10,
                         height: 10,
                         child: SwitchScreen()),
                      // trailing: Icon(Icons.abc,),
                    ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                        return FaqsScreen();
                      },));
                    },
                    child: CardInDrawer(iconUrl: 'images/info.svg',name: 'Account Information',)),
                  InkWell(
                      onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                        return ProfileScreen();
                      },));
                    },
                    child: CardInDrawer(iconUrl: 'images/Lock.svg',name: 'Password',)),
                  CardInDrawer(iconUrl: 'images/bag.svg',name: 'Order',),
                  CardInDrawer(iconUrl: 'images/card.svg',name: 'My Cards',),
                  CardInDrawer(iconUrl: 'images/Vector.svg',name: 'Wishlist',),
                  InkWell(
                     onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                        return SettingsScreen();
                      },));
                    },
                    child: CardInDrawer(iconUrl: 'images/Setting.svg',name: 'Settings',)),
                  InkWell(
                    onTap: (){
                      logout();
                    },
                    
                    child: CardInDrawer(iconUrl: 'images/Logout.svg',name: 'Logout',)),

                      SizedBox(height: 35,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Row(
                        children: 
                        [
                          Text('If you have any complaints ? '),
                          TextButton(
                          onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder:(context) {
                          return ComplaintsScreen();
                        },));
                          }, 
                          child: 
                          Text('Click Here'),
                          ),
                      
                        ],
                      ),
                    ),
                 


                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> logout() async {
    bool status = await UserPreferenceController().loggedOut();
    if (status) {
      Navigator.pushNamed(context, '/login_screen');
      
      showSnackBar(
          context: context, message: 'LOGOUT SUCCESSFULY', error: false);
    } else {
      showSnackBar(
          context: context,
          message: 'SOMETHING ERROR IN LOGOUT ,TRY AGAIN',
          error: true);
    }
  }
}

class CardInDrawer extends StatelessWidget {
  final String name;
  final String iconUrl;
  CardInDrawer({
    required this.name,
    required this.iconUrl,
  });
  @override
  Widget build(BuildContext context) {
    return
        ListTile(
                      leading: IconButton(icon: SvgPicture.asset(iconUrl),onPressed: (){},),
                       title: Text(name,
                         style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
                       ),
                    );
  }
}





