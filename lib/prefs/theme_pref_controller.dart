//  import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../main.dart';

// Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   _saveThemeStatus() async {
//     SharedPreferences pref = await _prefs;
//     pref.setBool('theme',Themes()._);
//   }

//   _getThemeStatus() async {
//     var _isLight = _prefs.then((SharedPreferences prefs) {
//       return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
//     }).obs;
//     Themes()._isLightTheme.value = (await _isLight.value)!;
//     Get.changeThemeMode(Themes()._isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
//   }  