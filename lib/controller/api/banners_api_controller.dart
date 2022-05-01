import 'dart:convert';
import 'dart:io';

import 'package:softagi_api/controller/api_settings.dart';
import 'package:softagi_api/model/banners_model.dart';
import 'package:http/http.dart' as http;
class BannerApiController{



     Future<List<Banners>> getCategories()async{
    var url =Uri.parse(ApiSettings.BANNERS);
    var response = await http.get(url);
    var decoded = json.decode(response.body);
    
    if(response.statusCode==200){
       return (decoded['data']['data'] as List)
            .map((json) => Banners.fromJson(json))
            .toList();
    }else if(response.statusCode==400){
      throw HttpException(decoded['status_message']);
    }else{
    }
    return [];

  }

}