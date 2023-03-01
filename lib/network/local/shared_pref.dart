import 'package:shared_preferences/shared_preferences.dart';

class casheHelper {
  static late SharedPreferences sharedPreferances;
  static init() async {
    sharedPreferances = await SharedPreferences.getInstance();
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferances?.get(key);
  }

  static Future<bool?> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) {
      return await sharedPreferances?.setBool!(key, value);
    }
    if (value is int) {
      return await sharedPreferances?.setInt!(key, value);
    }
    if (value is String) {
      return await sharedPreferances?.setString!(key, value);
    }
    return await sharedPreferances?.setDouble!(key, value);
  }

  static Future<bool?> removeData({
    required String key,
  }) async {
    return await sharedPreferances?.remove!(key);
  }
}
