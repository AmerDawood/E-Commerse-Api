class Banners {
  int? id;
  String? image;
  Null? category;
  Null? product;


  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    product = json['product'];
  }

}