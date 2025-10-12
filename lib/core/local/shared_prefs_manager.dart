import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  static late SharedPreferences sharedPreferences;
  // SharedPrefsManager(this.sharedPreferences);
  static Future<SharedPreferences> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    log("My SharedPrefs");
    return sharedPreferences;
  }

  static Future<bool?> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
    return await sharedPreferences.setDouble(key, value);
  }

  static dynamic getData({
    required String key,
  }) async {
    return sharedPreferences.get(key);
  }

  static Future<bool?> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool?> removeDataAll() async {
    return await sharedPreferences.clear();
  }

  static Future<bool?> containKey({
    required String key,
  }) async {
    return sharedPreferences.containsKey(key);
  }
}
