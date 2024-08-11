import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Token {

  static final   storage = FlutterSecureStorage();

 static Future<void> storeToken(String token) async {
    await storage.write(key: 'access_token', value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'access_token');
  }



}