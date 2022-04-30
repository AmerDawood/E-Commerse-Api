import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi_api/model/users_model.dart';

class UserPreferenceController {
  static final UserPreferenceController _instanse =
      UserPreferenceController._internal();
  late SharedPreferences _sharedPreferences;
  UserPreferenceController._internal();
  factory UserPreferenceController() {
    return _instanse;
  }
  Future<void> initSharedPreference() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveUsers({required Users users}) async {
   _sharedPreferences.setBool('logged_in' ,true);
    _sharedPreferences.setInt('id', users.id);
    _sharedPreferences.setString('fullName', users.name);
    _sharedPreferences.setString('email', users.email);
    _sharedPreferences.setString('phone', users.phone);
    _sharedPreferences.setString('token', users.token);
    _sharedPreferences.setInt('points', users.points);
    _sharedPreferences.setInt('credit', users.credit);
    _sharedPreferences.setString('credit', users.image);
  }
  
  String get token =>_sharedPreferences.getString('token')??'';
  String get id =>_sharedPreferences.getString('id')??'';
  String get name =>_sharedPreferences.getString('fullName')??'';
  String get email =>_sharedPreferences.getString('email')??'';
  String get phone =>_sharedPreferences.getString('phone')??'';
    int get points =>_sharedPreferences.getInt('points')??0; 
    Future<bool> get active =>_sharedPreferences.setBool('logged_in', true);  

  String get credit =>_sharedPreferences.getString('credit')??'';
  //https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkMmzlIUYlGzd9_9aQA65trwsl4ruMFs4nsUZ5hTl6k-jmYOgCfN-jN3CEbYc-_8c6lIs&usqp=CAU
  // String get image =>_sharedPreferences.getString('image')??'';

  

  bool get loggedIn =>_sharedPreferences.getBool('logged_in')??false;
    Future<bool> loggedOut()async{
     return await _sharedPreferences.clear();
   }
  
}
