class Faqs {
  int? id;
  String? question;
  String? answer;


  Faqs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }

  
}