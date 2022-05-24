import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import '../constanse/const_color.dart';
import '../controller/api/favorites_api_controller.dart';
import '../model/cart_model.dart';

class OrdersScreen extends StatefulWidget {
    const OrdersScreen({Key? key}) : super(key: key);

    @override
    State<OrdersScreen> createState() => _CartScreenState();

  
  }

  class _CartScreenState extends State<OrdersScreen> {

    List<CartModel> _cart = <CartModel>[];
    late Future<List<CartModel>> _future;
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _future = FavoritesApiController().getCarts();
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(

          
          children: [
            Padding(
               padding: const EdgeInsets.only(top:40,bottom: 20),
              child: Text('Orders',
              style: TextStyle(
                fontSize: 28,
                fontWeight:FontWeight.w500,
              ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10, right: 16, left: 16),
                child:
                
                 FutureBuilder<List<CartModel>>(
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

                      return   ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        itemCount: _cart.length,
                       itemBuilder:(context, index){
                          return Dismissible(
                            key: ValueKey(0),
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 33),
                              child: Icon(
                                Icons.delete_forever,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                // controller.removeProduct(
                                //     controller.cartProducts[index].productId);
                              }
                            },
                            child: Row(
                              children: [
                              //  Container(
                              //        color: Colors.grey.shade200,
                              //        child: Image.network('${_cart[index]}'),
                              //      ),
                                  
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                    '${_cart[index].total}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${_cart[index].subTotal}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 95,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.grey.shade300,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              child: Icon(
                                                Icons.add,
                                                size: 20,
                                              ),
                                              onTap: () {
                                                // controller
                                                //     .increaseQuantity(index);
                                              },
                                            ),
                                            Text(
                                                ''),
                                            GestureDetector(
                                              child: Icon(
                                                Icons.remove,
                                                size: 20,
                                              ),
                                              onTap: () {
                                                // controller
                                                //     .decreaseQuantity(index);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                       },


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
            ),
            Material(
              elevation: 12,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 30, vertical: 17),
                    height: 84,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TOTAL',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              ' \$',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child:

                    ElevatedButton(
                        onPressed: (){

                        
                        },
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                      ),
                      child: Text('Buy Now'),
                    ),
               
                  )
                ],
              ),
            ),
          ],
        ),
      );



    }
  }

/*
  
                    ElevatedButton(
                      onPressed: () async {
                        final value = await showDialog<bool>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(
                                    'Are you sure you want to Buy this products? The Price is : \$'
                                ),

                                actions:[
                                  ElevatedButton(
                                    child: Text('No',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary:Color.fromARGB(255, 1, 26, 46),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ElevatedButton(
                                    child: Text('Confirm',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),),
                                    style: ElevatedButton.styleFrom(
                                      primary:Color.fromARGB(255, 1, 26, 46),
                                    ),
                                    onPressed: () {
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                      ),
                      child: Text('Buy Now'),
                    ),
               
 */