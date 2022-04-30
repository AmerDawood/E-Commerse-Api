import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:softagi_api/controller/api/settings_api_controller.dart';
import 'package:softagi_api/model/settings_model.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({ Key? key }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  // List<Settings> _settings =<Settings>[];
  // late Future<Settings> _future;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _future = SettingsApiController().getSettings();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Settings',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Column(
        children: 
      [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search',
                  iconColor: Colors.black,
                  prefixIcon:IconButton(
                    onPressed: (){},
                icon: SvgPicture.asset('images/Search.svg'),
                  ),
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                     width: 0,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),

  
      ]
      ),
    );
  }
}