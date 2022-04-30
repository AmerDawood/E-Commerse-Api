class Users {
 late int id;
 late  String name;
 late String email;
 late String phone;
 late String image;
 late int points;
 late int credit;
 late String token;

 


     

  Users.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }



}