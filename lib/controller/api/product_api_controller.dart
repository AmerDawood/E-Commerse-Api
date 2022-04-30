import 'dart:convert';
import 'dart:io';

import 'package:softagi_api/controller/api_settings.dart';
import 'package:softagi_api/model/product_model.dart';
import 'package:http/http.dart' as http;

import '../../model/category_model.dart';

class ProductApiController{


  Future<List<Product>> getProducts()async{
   var url =Uri.parse(ApiSettings.PRODUCTS);
   var response= await http.get(url);



var decoded = json.decode(response.body);
    
    if(response.statusCode==200){
       return (decoded['data']['data'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
    }else if(response.statusCode==400){
      throw HttpException(decoded['status_message']);
    }else{
    }
    return [];
  }
}