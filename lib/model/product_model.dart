class Product {
  int? id;
  dynamic ? price ;
  dynamic ? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
 late  bool inFavorites;
  bool? inCart;
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}


