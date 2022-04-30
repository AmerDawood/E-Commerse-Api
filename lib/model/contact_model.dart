class Contact {
  int? id;
  int? type;
  String? value;
  String? image;

  Contact({this.id, this.type, this.value, this.image});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    value = json['value'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['value'] = this.value;
    data['image'] = this.image;
    return data;
  }
}