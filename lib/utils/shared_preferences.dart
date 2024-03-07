import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  void saveToken(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future getToken(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key)??'';
  }
}
