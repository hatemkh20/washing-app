import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class FlutterSecureManager {
  static late FlutterSecureStorage storage;

  static Future<void> init() async {
    storage = const FlutterSecureStorage();
  }

  static Future<void> writeData(
      {required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  static Future<String?> readData({required String key}) async {
    return await storage.read(key: key);
  }

  static Future<void> deleteData({required String key}) async {
    await storage.delete(key: key);
  }
}