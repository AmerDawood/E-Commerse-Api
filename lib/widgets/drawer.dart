import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:softagi_api/prefs/user_pref_controller.dart';
import 'package:softagi_api/screens/faqs_screen.dart';
import 'package:softagi_api/screens/profile_screen.dart';
import 'package:softagi_api/utils/helpers.dart';

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
          Container(
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                // child: Image.network(
                //   '${UserPreferenceController().image}',
                // ),
                backgroundColor: Colors.white,
              ),
              title: Text(
                '${UserPreferenceController().name}',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(54, 89, 106, 1),
                ),
              ),
              subtitle: Row(
                children: [
                  Text(
                    'Active : ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${UserPreferenceController().loggedIn}'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: (){},
                child: Text('${UserPreferenceController().points} Orders'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.withOpacity(0.1),
                ),
              ),
            ),
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
                      //  trailing:SwitchListTile(
                      //    title:Text('test'),
                      //    subtitle: Text('kk'),
                      //    value: _notificationsState,
                      //    onChanged: (bool value){
                      //      setState(() {
                      //        _notificationsState=value;
                      //      });
                      //    },
                      //  ),
                      trailing: Icon(Icons.abc,),
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


                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 52),
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





