import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static late SharedPreferences _prefs; //instance of the class

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instances => _prefs;

  static Future<void> saveUid(String uid) async {
    await _prefs.setString('uid', uid); //key value pair
  }

  static String getUid() {
    return _prefs.getString('uid') ?? "";
  }
}

//We need the instances of Shared preferences we created ainstace 
//whenn  class get initialised  through init  then we created a instance of shred preferences and 
//intialised through _prefs variable
