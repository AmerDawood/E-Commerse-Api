import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:softagi_api/controller/api/product_api_controller.dart';
import 'package:softagi_api/screens/details_products_screen.dart';
import '../constanse/const_color.dart';
import '../controller/api_settings.dart';
import '../model/product_model.dart';
import '../widgets/custom_text.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen() : super();

  @override
  JobsState createState() => JobsState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class JobsState extends State<ProductsScreen> {
  final _debouncer = Debouncer();

  List<Product> prolist = [];
  List<Product> productList = [];

  static List<Product> parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

  
    List<Product> _cart = <Product>[];
    late Future<List<Product>> _future;
  
  @override
  void initState() {
    super.initState();
    ProductApiController().getProducts().then((subjectFromServer) {
      setState(() {
        prolist = subjectFromServer;
        productList = prolist;
      });
    });
      _future = ProductApiController().getProducts();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: context.theme.primaryColor,
        elevation: 0,
        title: Text(
          'Products',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/app_screen');
            },
            icon: Icon(
              Icons.arrow_back,
              // color: Colors.black,
            )),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                suffixIcon: InkWell(
                  child: Icon(Icons.search),
                ),
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Search ',
              ),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    productList = prolist
                        .where(
                          (u) => (u.description.toString().toLowerCase().contains(
                                string.toLowerCase(),
                              )
                              ),
                        )
                        .toList();
                  });
                });
              },
            ),
          ),
           SizedBox(
             height: 633,
             child:
             
             
                 FutureBuilder<List<Product>>(
                  future: _future,

                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: SpinKitRotatingCircle(
                        
                           color: primaryColor,
                          size: 50.0,
                        ),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      _cart = snapshot.data ?? [];

                      return 
              Padding(
               padding: const EdgeInsets.all(10.0),
               child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3 / 4.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          ),
                      itemCount: productList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return 
                        InkWell(
                          onTap: (){
                            Get.to(ProductDetailsScreen(productList[index]));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 170,
                                alignment: Alignment.center,
                                clipBehavior: Clip.antiAlias,
                                child: Stack(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                        productList[index].image.toString(),
                                      ),
                                      fit: BoxFit.cover,
                                      height: double.infinity,
                                      width: double.infinity,
                                    ),
                                    
                                    Row(
                                      children: [
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 1),
                                          child: IconButton(
                                            onPressed: () {},
                                            icon:
                                                SvgPicture.asset('images/Vector.svg'),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                       CustomText(
                                                text: productList[index]
                                                    .name
                                                    .toString(),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                // color: Colors.black
                                                ),
                                            CustomText(
                                                text:
                                                    'price : ${productList[index].price}\$',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.green),
                                            CustomText(
                                                text: 'discount : ${productList[index].discount} %',
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
                          ),
                        );
                      }
                      
                      
                      ),
             );
         
         
                    } else {
                      return Column(
                        children: [
                          Icon(
                            Icons.warning,
                            size: 80,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'No Data',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      );
                    }
                  },

                ),
            
           ),



     
        ],
      ),
  
    );
  }
}
