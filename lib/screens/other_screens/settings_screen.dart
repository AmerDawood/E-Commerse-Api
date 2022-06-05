import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:softagi_api/model/settings_model.dart';
import 'package:softagi_api/widgets/custom_text.dart';

import '../../network/api/settings_api_controller.dart';
import '../../widgets/setting_widget.dart';
import '../../widgets/theme_widget.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // List<Settings> _settings =<Settings>[];
  late Future<Settings> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = SettingsApiController().getSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        backgroundColor: context.theme.primaryColor,
        elevation: 0,

        title: Text(
          'Settings',
            style: TextStyle(
        fontSize: 25,fontWeight: FontWeight.w400),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/app_screen');
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('Change Theme'),
              trailing: SwitchButtonFlutter(),
            ),


          SizedBox(
            height: 900,
            child: Center(
              child: FutureBuilder<Settings>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Column(
                    
                       
                        children: 
                        [
                     
                     AboutAndTerms(title: 'About', details: snapshot.data!.about.toString(),),
                     AboutAndTerms(title: 'Terms', details: snapshot.data!.terms.toString(),),
      
                    
                    
                    
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),    
        ]
        ),
      ),
    );
  }
}




