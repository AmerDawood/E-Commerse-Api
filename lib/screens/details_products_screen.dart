import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:softagi_api/model/product_model.dart';
import 'package:softagi_api/widgets/custom_button.dart';
import 'package:softagi_api/widgets/custom_text.dart';

class ProductDetailsScreen extends StatefulWidget {
 final Product _product;
 ProductDetailsScreen(this._product);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
  
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
       children: [

         Stack(
          children: [
             Container(
             width: double.infinity,
             height: 350,
             color: Colors.blue,
           ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 350),
             child: Container(
               height: 200,
               color: Colors.amber,
               width: double.infinity,
             ),
           ),
          ],
         ),
        











         // Container(
         //   // height: 300,
         //   width: double.infinity,
         //   decoration: BoxDecoration(
         //     // color: Colors.green,
         //     color: Colors.white10,
         //     borderRadius: BorderRadius.only(
         //       topLeft: Radius.circular(30),
         //       topRight: Radius.circular(30),
         //     ),
         //   ),
         //   child: Column(
         //     children: [
         //       Padding(
         //         padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
         //         child: Text(
         //               '${widget._product.name}',
         //               maxLines: 1,
         //               overflow: TextOverflow.ellipsis,
         //               style: TextStyle(
         //                 color: Colors.black,
         //                 fontSize: 22,
         //               ),
         //             ),
         //       ),
         //       Padding(
         //         padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
         //         child: Row(
         //           children: [
         //             CustomText(
         //               text:
         //                   ' Price : ${widget._product.price} \$ ',
         //               fontSize: 22,
         //               fontWeight: FontWeight.bold,
         //               color: Colors.green,
         //             ),


         //             Spacer(),
                    

         //             Text(
         //               '${widget._product.oldPrice.toString()} \$',
         //                 style: TextStyle(
         //                   decoration: TextDecoration.lineThrough,
         //                   decorationColor: Colors.black,
         //                   decorationStyle: TextDecorationStyle.double,
         //                   decorationThickness: 2,
         //                       fontSize: 22,
         //               fontWeight: FontWeight.bold,
         //               color: Colors.red,
         //                   ),
         //             ),
         //           ],
         //         ),
         //       ),
         //       Padding(
         //         padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
         //         child: Row(
         //           children: [
         //              CustomText(
         //               text:
         //                   ' Discount : ${widget._product.discount} %',
         //               fontSize: 22,
         //               fontWeight: FontWeight.bold,
         //               color: Colors.black,
         //             ),
         //             SizedBox(
         //               width: 15,
         //             ),
         //             Spacer(),
         //             Row(
         //               children: [
         //                 Icon(
         //                   Icons.star,
         //                   color: Colors.amber,
         //                 ),
         //                 Icon(Icons.star, color: Colors.amber),
         //                 Icon(Icons.star, color: Colors.amber),
         //                 Icon(Icons.star, color: Colors.amber),
         //               ],
         //             ),
         //           ],
         //         ),
         //       ),
         //       Padding(
         //         padding: const EdgeInsets.only(top: 14, left: 20, right: 20),
         //         child: Container(
                  
         //           width: double.infinity,
         //           color: Colors.black.withOpacity(0.1),
         //           child: Center(
         //             child: Padding(
         //               padding: const EdgeInsets.all(8.0),
         //               child: Text('${widget._product.description}',maxLines: 6,overflow: TextOverflow.ellipsis,
                       
         //               style: TextStyle(
         //                 fontSize: 18,
         //               ),
                       
         //               ),
         //             ),
         //           ),
         //         ),
         //       ),
               
           
                       
         //     ],
             
         //   ),
           
         // ),
       
        
       ],
        ),
    );
  }
}