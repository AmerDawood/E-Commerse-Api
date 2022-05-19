import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:softagi_api/constanse/const_color.dart';
import 'package:softagi_api/controller/api/category_api_controller.dart';
import 'package:softagi_api/controller/api/product_api_controller.dart';
import 'package:softagi_api/controller/api/profile_api_controller.dart';
import 'package:softagi_api/model/category_model.dart';
import 'package:softagi_api/model/profile_model.dart';
import 'package:softagi_api/model/users_model.dart';
import 'package:softagi_api/prefs/user_pref_controller.dart';
import 'package:softagi_api/screens/orders_screen.dart';
import 'package:softagi_api/utils/helpers.dart';
import 'package:softagi_api/widgets/brand_widget.dart';
import 'package:softagi_api/widgets/custom_text.dart';
import 'package:softagi_api/widgets/drawer.dart';

import '../model/product_model.dart';
import '../widgets/category_in_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with Helpers {
  List<Category> _categories = <Category>[];
  late Future<List<Category>> _future;

  List<Product> _product = <Product>[];
  late Future<List<Product>> _future1;


  late Future<UserData> _future2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = CategoryAPIControllers().getCategories();
    _future1 = ProductApiController().getProducts();
    _future2 =ProfileApiController().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
     
        backgroundColor:context.theme.primaryColor,
        
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(onPressed: () {
             Navigator.push(context, MaterialPageRoute(
               builder: (context) {
               return OrdersScreen();
             },));
            }, icon: SvgPicture.asset('images/bag.svg')
            ),
          ),
        ],
         leading: Builder(
          builder: (context) {
            return IconButton(onPressed: (){
              Scaffold.of(context).openDrawer();
            }, icon: SvgPicture.asset('images/Menu.svg')
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child:FutureBuilder<UserData>(
                    future: _future2,
                    builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text(''),
                  );
                } else if (snapshot.hasData ) {
                  return CustomText(
                    text: 'Hi,  ${snapshot.data!.name.toString()}',
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                    // color: Colors.black,
                  );
                 
                } else {
                  return Text('');
                }
              },
           
                    
                  ),
                ),
                CustomText(
                  text: 'Welocme to Laza',
                  fontSize: 19,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                color: Colors.black.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Search',
                            iconColor: Colors.black,
                            prefixIcon:IconButton(
                              onPressed: (){},
                          icon: SvgPicture.asset('images/Search.svg'),
                            ),
                            
                            labelStyle: TextStyle(
                              fontSize: 20,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (){},
                          icon: SvgPicture.asset('images/Voice.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                        text: 'Category',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        // color: Colors.black
                        ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context,'/category_screen');
                      },
                      child: CustomText(
                          text: 'View All',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          // color: Colors.grey
                          ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                  child: FutureBuilder<List<Category>>(
                    future: _future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: SpinKitRotatingCircle(
                            color: Colors.blue,
                            size: 50.0,
                          ),
                        );
                      } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        _categories = snapshot.data ?? [];
                        return SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemCount: _categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: StackToCategory(
                                      imageUrl: '${_categories[index].image}',
                                      title: '${_categories[index].name}',
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.warning,
                                size: 80,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'No Category',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
                Row(
                  children: [
                    CustomText(
                        text: 'Choose Brand',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        // color: Colors.black
                        ),
                    Spacer(),
                    CustomText(
                        text: 'View All',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey
                        )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BrandWidget(text: 'Nike'),
                      BrandWidget(text: 'Adidas'),
                      BrandWidget(text: 'Zara'),
                      BrandWidget(text: 'Puma'),
                    ],
                  ),
                ),
                Row(
                  children: [
                    CustomText(
                        text: 'New Aeeaivel',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        // color: Colors.black
                        ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/products_screen');
                      },
                      child: CustomText(
                          text: 'View All',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey
                          ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                FutureBuilder<List<Product>>(
                  future: _future1,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: SpinKitRotatingCircle(
                          color: Colors.blue,
                          size: 50.0,
                        ),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      _product = snapshot.data ?? [];

                      return SizedBox(
                        height: 400,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 4.5,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemCount: 5,
                            itemBuilder: (BuildContext ctx, index) {
                              return Column(
                                children: [
                                  Container(
                                    height: 170,
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.antiAlias,
                                    child: Stack(
                                        children: [
                                          
                                          Image.network(
                                        _product[index].image.toString(),
                                        fit: BoxFit.cover,
                                        height: double.infinity,
                                      ),
                                       Row(
                                         children: [
                                           Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 1),
                                              child: IconButton(
                                              onPressed: (){},
                                              icon: SvgPicture.asset('images/Vector.svg'),
                                          ),
                                            ),
                                         ],
                                       ),
                                        ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(15)),
                                  ),
                                  Container(
                                    child: Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            CustomText(
                                                text: _product[index]
                                                    .name
                                                    .toString(),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                // color: Colors.black
                                                ),
                                            // SizedBox(height: 10,),
                                            CustomText(
                                                text:
                                                    'price : ${_product[index].price}\$',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.green
                                                ),
                                            CustomText(
                                                text: 'discount : ${_product[index].discount} %',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                // color: Colors.black
                                                ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      );
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.warning,
                              size: 80,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'No Category',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logout() async {
    bool status = await UserPreferenceController().loggedOut();
    if (status) {
      Navigator.pushNamed(context, '/login_screen');
      showSnackBar(
          context: context, message: 'LOGOUT SUCCESSFULY', error: false);
    } else {
      showSnackBar(
          context: context,
          message: 'SOMETHING ERROR IN LOGOUT ,TRY AGAIN',
          error: true);
    }
  }

  Future<void> getUserData() async {
    bool status = await UserPreferenceController().loggedOut();
    if (status) {
      showSnackBar(context: context, message: 'Get Data Done', error: false);
    } else {
      showSnackBar(context: context, message: 'SOMETHING ERROR', error: true);
    }
  }
}
