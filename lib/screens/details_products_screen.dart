import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:softagi_api/model/product_model.dart';
import 'package:softagi_api/screens/card_screen.dart';
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

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300.0,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Image(
                      image: NetworkImage(widget._product.image.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      IconButton(
                        icon: Icon(Icons.arrow_back,color: Colors.black,),
                        iconSize: 30.0,
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon:SvgPicture.asset('images/bag.svg',color: Colors.black,),
                        iconSize: 30.0,
                        onPressed: (){
                          Get.to(CardScreen());
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text(
                widget._product.name.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  letterSpacing: 1.8,
                ),
              ),
            ),
           Row(
             children: [
                Padding(
              padding: EdgeInsets.only(
                left: 20.0,
              ),
              child: Row(
                children: [
                  Text('Price : ',
                    style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
                  ),
                  Text('${widget._product.price} \$',
                    style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  color: Colors.green,

                ),),
                ],
              ),
                ),
            
            Spacer(),
              Padding(
              padding: EdgeInsets.only(
                right: 15,
              ),
              child: Text(
                '${widget._product.oldPrice.toString()} \$',
                
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.red,
                  decorationThickness: 2,
                ),
              ),
            ),
             ],
           ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  widget._product.discount.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Details',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 10.0),
              child: Text(
                widget._product.description.toString(),
                maxLines: 6,
                style: TextStyle(
                  fontSize: 19.0,
                  color: Colors.black38,
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60.0,
                    width: 220.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blue.shade200,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 20.0,
                          )
                        ]),
                    child: Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color:Colors.blue.shade200,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 20.0,
                          )
                        ]),
                    child: Center(
                        child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 30.0,
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}