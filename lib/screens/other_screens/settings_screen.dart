import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:softagi_api/controller/api/settings_api_controller.dart';
import 'package:softagi_api/model/settings_model.dart';
import 'package:softagi_api/widgets/custom_text.dart';

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
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Settings',
          // style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
            padding:const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ListTile(
                title: Text('Change Theme'),
                trailing: SwitchButtonFlutter(),
              ),
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




