import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:softagi_api/prefs/user_pref_controller.dart';
import 'package:softagi_api/utils/helpers.dart';

import '../../model/profile_model.dart';
import '../api_settings.dart';

class ProfileApiController with Helpers {
  Future<UserData> getUserData() async {
    var url = Uri.parse(ApiSettings.PROFILE);

    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: UserPreferenceController().token,
        HttpHeaders.acceptHeader: 'application/json',
      },
    );
    var decoded = json.decode(response.body);
    // print(decoded['message']);

    // return UserData.fromJson(decoded);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // print(decoded['data']);
      return UserData.fromJson(decoded['data']);
    } else {
      //
    }
    return decoded['message'];
  }

  Future<bool> updateProfile(
      {required BuildContext context,
      String? name,
      String? phone,
      String? email,
      String? image,
      String? password}) async {
    var url = Uri.parse(ApiSettings.updateProfile);

    var response = await http.put(url, headers: {
      HttpHeaders.authorizationHeader: UserPreferenceController().token,
      HttpHeaders.acceptHeader: 'application/json',
    }, body: {
      'name': name,
      'phone': phone,
      'password': password,
      'email': email,
      'image': image,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse == true) {
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

   Future<bool> changePassword({required BuildContext context,required String current_password , required String new_password})async{
 var url = Uri.parse(ApiSettings.ChangePassword);
    var response = await http.post(url,
    headers: {
        HttpHeaders.authorizationHeader: UserPreferenceController().token,
        HttpHeaders.acceptHeader: 'application/json',
    },
     body: {
      'current_password': current_password,
      'new_password':new_password,
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
