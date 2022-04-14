
import 'package:shared_preferences/shared_preferences.dart';
const String _storageKeyMobileToken = "token";

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Future<String> getMobileToken()async {
  final SharedPreferences prefs = await _prefs;


  return prefs.getString(_storageKeyMobileToken) ?? '';
}


Future<bool> setMobileToken(String token) async {
  SharedPreferences.setMockInitialValues({});

  final SharedPreferences prefs = await _prefs;


  return prefs.setString(_storageKeyMobileToken, token);
}