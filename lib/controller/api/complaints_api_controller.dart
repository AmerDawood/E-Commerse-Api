import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:softagi_api/controller/api_settings.dart';
import 'package:softagi_api/model/complaints_model.dart';
import 'package:http/http.dart' as http;
import 'package:softagi_api/utils/helpers.dart';

class ComplaintsApiController with Helpers{

   Future<bool> addComplaints(
      {required BuildContext context,
      required String name,
      required String email,
      required String message,
      required String phone
      }) async {
    var url = Uri.parse(ApiSettings.COMPLAINTS);
    var response = await http.post(
      url,
       body: { 
      'name': name,
      'email': email,
      'message': message,
      'phone': phone,
    }
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] ==true) {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
        );
        return true;
      } else if(jsonResponse['status'] ==false){
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
        );
        return false;
      }
    } else if (response.statusCode == 400) {
      //
    }

    return false;
    
  }
}