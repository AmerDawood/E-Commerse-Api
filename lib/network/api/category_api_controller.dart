import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart'as http;
import 'package:softagi_api/model/category_model.dart';
import '../api_settings.dart';
class CategoryAPIControllers{


  Future<List<Category>> getCategories()async{
    var url =Uri.parse(ApiSettings.CATEGORY);
    var response = await http.get(url);
    var decoded = json.decode(response.body);
    
    if(response.statusCode==200){
       return (decoded['data']['data'] as List)
            .map((json) => Category.fromJson(json))
            .toList();
    }else if(response.statusCode==400){
      throw HttpException(decoded['status_message']);
    }else{
    }
    return [];

  }
}