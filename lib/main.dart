import 'dart:io';
import 'package:flutter/material.dart';
import 'package:softagi_api/prefs/user_pref_controller.dart';
import 'package:softagi_api/screens/app_screen.dart';
import 'package:softagi_api/screens/category_screen.dart';
import 'package:softagi_api/screens/contact_screen.dart';
import 'package:softagi_api/screens/faqs_screen.dart';
import 'package:softagi_api/screens/home_sceen.dart';
import 'package:softagi_api/screens/login_screen.dart';
import 'package:softagi_api/screens/products_screen.dart';
import 'package:softagi_api/screens/profile_screen.dart';
import 'package:softagi_api/screens/register_screen.dart';
import 'package:softagi_api/screens/splash_screen.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferenceController().initSharedPreference();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/spalsh_screen',
      debugShowCheckedModeBanner: false,
      routes: {
        '/app_screen':(context)=>AppScreen(),
        '/spalsh_screen':(context)=>SplashScreen(),
       '/login_screen':(context) =>LoginScreen(),
       '/register_screen':(context) => RegisterScreen(),
       '/home_screen':(context)=>HomeScreen(),
       '/profile_screen':(context)=>ProfileScreen(),
       '/category_screen':(context)=>CategoryScreen(),
       '/products_screen':(context)=>ProductsScreen(),
       '/faqs_screen':(context)=>FaqsScreen(),
       '/contact_screen':(context)=>ContactScreen(),
      },
    );
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}