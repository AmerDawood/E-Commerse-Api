import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:softagi_api/controller/api_settings.dart';
import 'package:softagi_api/prefs/user_pref_controller.dart';

import '../../model/profile_model.dart';



class ProfileApiController{

   Future<UserData> getUserData()async{

    var url = Uri.parse(ApiSettings.PROFILE);

    var response =await http.get(url,
    headers: {
      HttpHeaders.authorizationHeader:UserPreferenceController().token,
      HttpHeaders.acceptHeader:'application/json',
    },
    
    );
    
    var decoded =json.decode(response.body);
    // print(decoded['message']);
      
    // return UserData.fromJson(decoded);

    if(response.statusCode==200){
      var jsonResponse =jsonDecode(response.body);
      print(decoded['data']);
      return UserData.fromJson(decoded['data']);
    }else{
      //
    }
    return decoded['message'];
    
    



   }



}
