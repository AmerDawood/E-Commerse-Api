import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:softagi_api/constanse/const_color.dart';
import 'package:softagi_api/screens/category_screen.dart';
import 'package:softagi_api/screens/faviorate_screen.dart';
import 'package:softagi_api/screens/home_sceen.dart';
import 'package:softagi_api/screens/orders_screen.dart';
import 'package:softagi_api/screens/profile/profile_screen.dart';
import '../model/bn_screen.dart';
import 'card_screen.dart';


class AppScreen extends StatefulWidget {

  const AppScreen({ Key? key }) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

  late int _currentIndex = 0;
  final List<BnScreen> _bnScreen = <BnScreen>[
   BnScreen(widget: HomeScreen(), title: 'Category'),
   BnScreen(widget: FaviorateScreen(), title: 'Product'),
   BnScreen(widget: OrdersScreen(), title: 'Profile'),
   BnScreen(widget: CartScreen(), title: 'faviorate'),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // backgroundColor: context.theme.backgroundColor,
      
       bottomNavigationBar: BottomNavigationBar(
         
        type: BottomNavigationBarType.fixed,
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        // backgroundColor: Colors.white,
        // elevation: 0,
        selectedFontSize: 17,
        selectedIconTheme: IconThemeData(color: Colors.black),

        items: [
BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset('images/Home.svg',color: Colors.grey,height: 15),
              activeIcon: SvgPicture.asset('images/Home.svg',color: primaryColor,height: 18,),
          ),
           BottomNavigationBarItem(
               label: '',
              icon: SvgPicture.asset('images/Vector.svg',color: Colors.grey,),
              activeIcon: SvgPicture.asset('images/Vector.svg',color:primaryColor),

           ),
          
          BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset('images/bag.svg',color: Colors.grey,),
              activeIcon: SvgPicture.asset('images/bag.svg',color: primaryColor),
          ),
          BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset('images/card.svg',color: Colors.grey,),
              activeIcon: SvgPicture.asset('images/card.svg',color: primaryColor),
          ),

        ],

      ),

      body: _bnScreen[_currentIndex].widget,
    );
  }
}