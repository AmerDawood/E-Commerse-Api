import 'package:flutter/material.dart';
import 'package:softagi_api/model/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
 final Product _product;
 ProductDetailsScreen(this._product);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
  
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
         Container(
           height: 300,
           width: double.infinity,
           color: Colors.black,
           
           
         ),
          
        ],
      ),
    );
  }
}