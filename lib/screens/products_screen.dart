
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:softagi_api/controller/api/product_api_controller.dart';
import 'package:softagi_api/model/product_model.dart';

import '../widgets/custom_text.dart';
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({ Key? key }) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  List<Product>_product =<Product>[];
  late Future<List<Product>> _future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future =ProductApiController().getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        // backgroundColor: Colors.black.withOpacity(0.1),
        backgroundColor: Colors.grey.shade100,
         appBar: AppBar(
         backgroundColor: Colors.grey.shade100,
          elevation: 0,
        title: Text('Products',style: TextStyle(color: Colors.black,fontSize: 25),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/app_screen');
          },
          icon: Icon(Icons.arrow_back,color:Colors.black,)
        ),
      ),
       body: 
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FutureBuilder<List<Product>>(
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
                        _product = snapshot.data ?? [];

                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 4.5,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemCount: _product.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Column(
                                children: [
                                  Container(
                                    height: 170,
                                    alignment: Alignment.center,
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
                                                color: Colors.black),
                                            CustomText(
                                                text:
                                                    'discount : ${_product[index].discount}\$',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                            CustomText(
                                                text: 'Price',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
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
            
    );
    
  }
}