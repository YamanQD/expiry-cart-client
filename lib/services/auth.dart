import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:expiry_cart/models/user.dart';
import 'package:expiry_cart/categories_helper/utils.dart';
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
    print(creds.toString());

    try {
      var res = await http.post(Uri.parse('${Utils.baseUrl}api/login'),
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
        var res = await http.get(Uri.parse('${Utils.baseUrl}api/user'),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token'
            });
        if (res.statusCode == 200) {
          _isLoggedIn = true;
          _user = User.fromRawJson(res.body);
          _token = token;
          storeToken(token: token);
          print('t  ' + _token.toString());
          return true;
        }
        return false;
      } catch (e) {
        print(e.toString());
        return false;
      }
    }
  }

  static void storeToken({String token}) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<bool> useTokenFromStorage() async {
    print('before ' + _token.toString());
    _token = await storage.read(key: 'token');
    print('after1 ' + _token.toString());
    if (await tryToken(token: _token)) {
      print('after2 ' + _token.toString());
      return true;
    }
    print('after3 ' + _token.toString());
    return false;
  }

  static void logout() async {
    try {
      await http.post(Uri.parse('${Utils.baseUrl}api/logout'), headers: {
        'Authorization': 'Bearer $_token',
        'Accept': 'application/json'
      });
      cleanUp();
    } catch (e) {
      print(e.toString());
    }
  }

  static void cleanUp() async {
    _user = null;
    _isLoggedIn = false;
    _token = null;
    await storage.delete(key: 'token');
  }
}
