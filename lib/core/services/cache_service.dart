import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    // make set data after check the type
    if(value is bool){
      return await _sharedPreferences.setBool(key, value);
    } else if (value is String){
      return await _sharedPreferences.setString(key, value);
    } else if (value is int){
      return await _sharedPreferences.setInt(key, value);
    } else if (value is double){
      return await _sharedPreferences.setDouble(key, value);
    } else if (value is List<String>){
      return await _sharedPreferences.setStringList(key, value);
    } else {
      return false;
    } 
  }

  // seprate the get function to his type
  static Future<bool> getBool({required String key}) async {
    return _sharedPreferences.getBool(key) ?? false;
  }

  static Future<String> getString({required String key}) async {
    return _sharedPreferences.getString(key) ?? '';
  }

  static Future<int> getInt({required String key}) async {
    return _sharedPreferences.getInt(key) ?? 0;
  }

  static Future<double> getDouble({required String key}) async {
    return  _sharedPreferences.getDouble(key) ?? 0.0;
  }

  static Future<List<String>> getStringList({required String key}) async {
    return  _sharedPreferences.getStringList(key) ?? [];
  } 



  static Future<void> removeData({
    required String key,
  }) async {
    await _sharedPreferences.remove(key);
  }

  static Future<void> clearData() async {
    await _sharedPreferences.clear();
  }


}
