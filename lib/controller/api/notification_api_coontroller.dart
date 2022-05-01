import 'dart:convert';
import 'dart:io';

import 'package:softagi_api/model/notification_model.dart';

import '../api_settings.dart';
import 'package:http/http.dart' as http;
class NotificationApiController{


   Future<List> getCategories()async{
    var url =Uri.parse(ApiSettings.NOTIFICATIONS);
    var response = await http.get(url);
    var decoded = json.decode(response.body);
    
    if(response.statusCode==200){
       return (decoded['data']['data'] as List)
            .map((json) => Notifications.fromJson(json))
            .toList();
    }else if(response.statusCode==400){
      throw HttpException(decoded['message']);
    }else{
    }
    return [];

  }
}