import 'package:get/get.dart';

class FavoriteModel extends GetxController{
  int? id;
  Product? product;


  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }


}

class Product {
  int ? id;
  dynamic  ?price;
  dynamic ? oldPrice;
  dynamic ? discount;
  String ? image;
  String ? name;
  String ? description;



  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }


}