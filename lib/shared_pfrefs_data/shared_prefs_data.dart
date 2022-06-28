import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsData {

  /// this is dtring data
  static Future setStringData(String key,String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future getStringData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     return prefs.getString(key);
  }


  ///this is bool data

  static Future setBoolData(String key,bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  static Future getBoolData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}