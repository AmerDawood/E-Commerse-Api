import 'dart:convert';
import 'dart:io';

import 'package:softagi_api/model/faqs_model.dart';


import 'package:http/http.dart' as http;

import '../api_settings.dart';
class FaqsApiController{


  Future<List<Faqs>> getFaqs()async{
   var url = Uri.parse(ApiSettings.FAQS);

   var response =await http.get(url);
   
    var decoded = json.decode(response.body);
    
    if(response.statusCode==200){
       return (decoded['data']['data'] as List)
            .map((json) => Faqs.fromJson(json))
            .toList();
    }else if(response.statusCode==400){
      throw HttpException(decoded['status_message']);
    }else{
    }
    return [];
  }

}