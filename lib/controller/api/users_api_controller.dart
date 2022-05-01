import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:softagi_api/controller/api_settings.dart';
import 'package:softagi_api/prefs/user_pref_controller.dart';
import 'package:softagi_api/utils/helpers.dart';
import '../../model/users_model.dart';
import 'package:http/http.dart' as http;

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

 Future<bool>getUserData({required BuildContext context})async{
    var url =Uri.parse(ApiSettings.PROFILE);
    var response = await http.get(
      url,headers: {
      HttpHeaders.authorizationHeader: UserPreferenceController().token,
      HttpHeaders.acceptHeader: 'application/json',
    },);
        if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['data'] != null) {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['data']['name'],
        );
        return true;
      } else {
        return false;
      }
    } else if (response.statusCode == 400) {
      //
    }

    return false;
 }

  }

