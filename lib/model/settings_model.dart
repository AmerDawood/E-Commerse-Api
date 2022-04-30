class Settings {
  
  String? about;
  String? terms;

  Settings.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    terms = json['terms'];
  }

}

