import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Session {
  final KEY = "SESSION";
  final storage = new FlutterSecureStorage();

  set(String token, int expiresIn) async {
    final data = {
      "token": token,
      "expiresIn": expiresIn,
      "createdAt": DateTime.now().toString()
    };
    await storage.write(key: KEY, value: jsonEncode(data));
  }

  get() async {
    final result = await storage.read(key: KEY);
    if (result != null) {
      return jsonDecode(result);
    }
    return null;
  }

  clear() async {
    await storage.deleteAll();
  }
}
