
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData _darkTheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    appBarTheme: AppBarTheme(color: Colors.green),

    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.white,
      splashColor: Colors.white,

    ));

ThemeData _lightTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.white,
      splashColor: Colors.white,
    ));

class SwitchButtonFlutter extends StatelessWidget {
  RxBool _isLightTheme = false.obs;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', _isLightTheme.value);
  }

  Future<void> getThemeStatus() async {
    var _isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
    }).obs;
    _isLightTheme.value = (await _isLight.value)!;
    Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  SwitchButtonFlutter() {
    getThemeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ObxValue(
                (data) => Switch(
                  value: _isLightTheme.value,
                  onChanged: (val) {
                    _isLightTheme.value = val;
                    Get.changeThemeMode(
                      _isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                    );
                    saveThemeStatus();
                  },
                ),
                false.obs,
              ),
            ],
          );
  }
}