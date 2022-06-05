import 'dart:convert';
import 'dart:io';

import 'package:softagi_api/model/product_model.dart';
import 'package:http/http.dart' as http;

import '../../model/category_model.dart';
import '../api_settings.dart';

class ProductApiController{


  Future<List<Product>> getProducts()async{
   var url =Uri.parse(ApiSettings.PRODUCTS);
   var response= await http.get(url);



var decoded = json.decode(response.body);
// print(decoded['data']['data']);
    
    if(response.statusCode==200){
       return (decoded['data']['data'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
    }else if(response.statusCode==400){
      throw HttpException(decoded['message']);
    }else{
    }
    return [];
  }


  Future<List<Product>> getSearchProducts()async{
     var url =Uri.parse(ApiSettings.productsSearch);
   var response= await http.get(url);

var decoded = json.decode(response.body);
    
    if(response.statusCode==200){
       return (decoded['data']['data'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
    }else if(response.statusCode==400){
      throw HttpException(decoded['message']);
    }else{
    }
    return [];
  }
}