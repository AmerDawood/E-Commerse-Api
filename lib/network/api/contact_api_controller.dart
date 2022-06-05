import 'dart:convert';
import 'dart:io';

import 'package:softagi_api/model/contact_model.dart';
import 'package:http/http.dart' as http;

import '../api_settings.dart';
class ContactApiController{
  
  Future<List<Contact>> getContact()async{
    var url =Uri.parse(ApiSettings.CONTACTS);
    var response = await http.get(url);
    var decoded = json.decode(response.body);
    
    if(response.statusCode==200){
       return (decoded['data']['data'] as List)
            .map((json) => Contact.fromJson(json))
            .toList();
    }else if(response.statusCode==400){
      throw HttpException(decoded['message']);
    }else{
    }
    return [];

  }
}