import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi_api/prefs/user_pref_controller.dart';
import 'package:softagi_api/screens/app_screen.dart';
import 'package:softagi_api/screens/auth/login_screen.dart';
import 'package:softagi_api/screens/auth/register_screen.dart';
import 'package:softagi_api/screens/auth/send_code_screen.dart';
import 'package:softagi_api/screens/auth/splash_screen.dart';
import 'package:softagi_api/screens/category_screen.dart';
import 'package:softagi_api/screens/contact_screen.dart';
import 'package:softagi_api/screens/faqs_screen.dart';
import 'package:softagi_api/screens/home_sceen.dart';
import 'package:softagi_api/screens/product_screen.dart';
import 'package:softagi_api/screens/profile_screen.dart';
import 'package:softagi_api/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferenceController().initSharedPreference();
  HttpOverrides.global = new MyHttpOverrides();
  runApp( MyApp());
}

class ThemeFlutter{
  
  ThemeData _darkTheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ));

ThemeData _lightTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ));


}

// class SwitchFlutter extends StatelessWidget {
//   const SwitchFlutter({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Obx(
//                   () => Text(
//                     '${MyApp()._isLightTheme.value ? 'Dark' : 'Light'} theme',
//                   ),
//                 ),
//                 ObxValue(
//                   (data) => Switch(
//                     value: MyApp()._isLightTheme.value,
//                     onChanged: (val) {
//                       MyApp()._isLightTheme.value = val;
//                       Get.changeThemeMode(
//                         MyApp()._isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
//                       );
//                       MyApp()._saveThemeStatus();
//                     },
//                   ),
//                   false.obs,
//                 ),
//               ],
//             );
      
//   }
// }







class MyApp extends StatelessWidget {
  //   RxBool _isLightTheme = false.obs;

  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // _saveThemeStatus() async {
  //   SharedPreferences pref = await _prefs;
  //   pref.setBool('theme', _isLightTheme.value);
  // }

  // _getThemeStatus() async {
  //   var _isLight = _prefs.then((SharedPreferences prefs) {
  //     return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
  //   }).obs;
  //   _isLightTheme.value = (await _isLight.value)!;
  //   Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  // }

  
  // MyApp() {
  //   _getThemeStatus();
  // }



  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      
 theme: ThemeFlutter()._lightTheme,
      darkTheme: ThemeFlutter()._darkTheme,
      themeMode: ThemeMode.system,
//  theme: ThemeData(primarySwatch: Colors.green),
//       darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.red),
      initialRoute: '/splash_screen',
      debugShowCheckedModeBanner: false,
      routes: {
        '/app_screen': (context) => AppScreen(),
        '/splash_screen': (context) => SplashScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/register_screen': (context) => RegisterScreen(),
        '/home_screen': (context) => HomeScreen(),
        '/profile_screen': (context) => ProfileScreen(),
        '/category_screen': (context) => CategoryScreen(),
        '/products_screen': (context) => ProductsScreen(),
        '/faqs_screen': (context) => FaqsScreen(),
        '/contact_screen': (context) => ContactScreen(),
        '/send_code': (context) => SendCodeScreen(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }


  
}












