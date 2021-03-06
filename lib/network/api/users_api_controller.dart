import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:softagi_api/prefs/user_pref_controller.dart';
import 'package:softagi_api/utils/helpers.dart';
import '../../model/users_model.dart';
import 'package:http/http.dart' as http;

import '../api_settings.dart';

class UserAPIController with Helpers {
  Future<bool> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    var url = Uri.parse(ApiSettings.LOGIN);
    var response =
        await http.post(url, body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['data'] != null) {
        Users users = Users.fromJson(jsonResponse['data']);
        UserPreferenceController().saveUsers(users: users);
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
        );
        return true;
      } else if (response.statusCode == 400) {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: false,
        );
      }
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
      return false;
    }
    return false;
  }

  Future<bool> register(
      {
        required BuildContext context,
      required String name,
      required String email,
      required String password,
      required String phone
      }) async {
    var url = Uri.parse(ApiSettings.REGISTER);
    var response = await http.post(url, body: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['data'] != null) {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
        );
        return true;
      } else {
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
   Future<bool> logout({required BuildContext context}) async {
    var url = Uri.parse(ApiSettings.LOGOUT);
    var response = await http.post(url, headers: {
      HttpHeaders.authorizationHeader: UserPreferenceController().token,
      HttpHeaders.acceptHeader: 'application/json',
    });

    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 401) {
      await UserPreferenceController().loggedOut();
      
    } else {

    }
    return false;
    
  }



  Future<bool> verifyEmail({required BuildContext context , required String email}) async{
    var url = Uri.parse(ApiSettings.verifyEmail);
    var response = await http.post(url, body: {
      'email': email
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['data'] != null) {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: false,
        );
        return true;
      } else {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true,
        );
        return false;
      }
    } else if (response.statusCode == 400) {
      //
    }

    return false;

  }

  Future<bool> verifyCode({required BuildContext context , required String email,required String code}) async{
    var url = Uri.parse(ApiSettings.verifyCode);
    var response = await http.post(url, body: {
      'email': email,
      'code':code,
    },
     headers: {
        HttpHeaders.authorizationHeader: UserPreferenceController().token,
        HttpHeaders.acceptHeader: 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['data'] != null) {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: false
        );
        return true;
      } else {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true,
        );
        return false;
      }
    } else if (response.statusCode == 400) {
      //
    }

    return false;

  }

  Future<bool> resetPassword({required BuildContext context , required String email,required String code,required String password}) async{
    var url = Uri.parse(ApiSettings.resetPassword);
    var response = await http.post(url, body: {
      'email': email,
      'code':code,
      'password':password,
    }
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['data'] != null) {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: false,
        );
        return true;
      } else {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true,
        );
        return false;
      }
    } else if (response.statusCode == 400) {
      //
    }

    return false;

  }


 


}

