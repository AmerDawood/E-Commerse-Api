import 'dart:convert';

import 'package:softagi_api/controller/api_settings.dart';
import 'package:softagi_api/model/settings_model.dart';


import 'package:http/http.dart' as http;
class SettingsApiController{

  Future<Settings> getSettings()async{
   var url =Uri.parse(ApiSettings.SETTINGS);
   var response =await http.get(url);
      //  print(response.body);

       var decoded = json.decode(response.body);
       return Settings.fromJson(decoded['data']);
       
   
  }
}