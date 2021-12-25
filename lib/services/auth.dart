import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:expiry_cart/models/user.dart';
import 'dart:convert';

class Auth {
  static bool _isLoggedIn = false;
  static User _user;
  static String _token;

  static bool get authenticated => _isLoggedIn;
  static User get user => _user;
  static String get token => _token;

  static const storage = FlutterSecureStorage();

  static Future<bool> login({Map creds}) async {
    print(creds);

    try {
      var res = await http.post(
          Uri.parse('http://yaman.muhajreen.net:8000/api/login'),
          body: jsonEncode(creds),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });
      print(res.body.toString());

      if (res.statusCode == 200) {
        String token = jsonDecode(res.body)['token'];
        return await tryToken(token: token);
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> tryToken({String token}) async {
    if (token == null) {
      return false;
    } else {
      try {
        var res = await http.get(
            Uri.parse('http://yaman.muhajreen.net:8000/api/user'),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token'
            });
        if (res.statusCode == 200) {
          _isLoggedIn = true;
          _user = User.fromRawJson(res.body);
          _token = token;
          storeToken(token: token);
          print(_user);
          return true;
        }
        return false;
      } catch (e) {
        print(e);
        return false;
      }
    }
  }

  static void storeToken({String token}) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<bool> useTokenFromStorage() async {
    _token = await storage.read(key: 'token');
    if (await tryToken(token: _token)) {
      return true;
    }
    return false;
  }

  static void logout() async {
    try {
      await http.post(Uri.parse('http://yaman.muhajreen.net:8000/api/logout'),
          headers: {
            'Authorization': 'Bearer $_token',
            'Accept': 'application/json'
          });
      cleanUp();
    } catch (e) {
      print(e);
    }
  }

  static void cleanUp() async {
    _user = null;
    _isLoggedIn = false;
    _token = null;
    await storage.delete(key: 'token');
  }
}
