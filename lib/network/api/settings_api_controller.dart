import 'dart:convert';

import 'package:softagi_api/model/settings_model.dart';


import 'package:http/http.dart' as http;

import '../api_settings.dart';
class SettingsApiController{

  Future<Settings> getSettings()async{
   var url =Uri.parse(ApiSettings.SETTINGS);
   var response =await http.get(url);
      //  print(response.body);

       var decoded = json.decode(response.body);
       return Settings.fromJson(decoded['data']);
       
   
  }
}