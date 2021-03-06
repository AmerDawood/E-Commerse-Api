import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi_api/prefs/user_pref_controller.dart';
import 'package:softagi_api/screens/app_screen.dart';
import 'package:softagi_api/screens/auth/ManOrWoman.dart';
import 'package:softagi_api/screens/auth/login_screen.dart';
import 'package:softagi_api/screens/auth/register_screen.dart';
import 'package:softagi_api/screens/auth/send_code_screen.dart';
import 'package:softagi_api/screens/auth/splash_screen.dart';
import 'package:softagi_api/screens/category_screen.dart';
import 'package:softagi_api/screens/home_sceen.dart';
import 'package:softagi_api/screens/other_screens/contact_screen.dart';
import 'package:softagi_api/screens/other_screens/faqs_screen.dart';
import 'package:softagi_api/screens/product_screen.dart';
import 'package:softagi_api/screens/profile/profile_screen.dart';
import 'package:softagi_api/widgets/theme_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferenceController().initSharedPreference();
  await SwitchButtonFlutter().getThemeStatus();
  await SwitchButtonFlutter().saveThemeStatus();
  HttpOverrides.global = new MyHttpOverrides();
  runApp( MyApp());
}

class ThemeFlutter{
  final ThemeData _darkTheme = ThemeData(
    accentColor: Colors.black,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.white,
      splashColor: Colors.white,
    )
    );

final ThemeData _lightTheme = ThemeData(
    accentColor: Colors.grey,
    brightness: Brightness.dark,
    primaryColor: Colors.black.withOpacity(0.1),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
      disabledColor: Colors.white,
      splashColor: Colors.white,

    ),
    );


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return  GetMaterialApp(
      
 theme: ThemeFlutter()._lightTheme,
      darkTheme: ThemeFlutter()._darkTheme,
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
        '/manOrWoman':(context)=>ManOrWoman(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides { 
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}





