import 'dart:convert';

import 'dart:io';
import 'package:expiry_cart/services/auth.dart';
import 'package:expiry_cart/categories_helper/category.dart';
import 'package:expiry_cart/models/product.dart';
import 'package:http/http.dart' as http;

class Utils {
  static String baseUrl = 'http://yaman.muhajreen.net:8000/';
  // static String baseUrl = 'http://192.168.1.18:8000/';
  static String tok = '64|0kmhbzARSZKIEWZ5mwNoIi2Y7U8RWAd1f5B9R1EM';
  // static String tok = '5|H4jS2F40VsEK8WEHSthW2HVbbawdjubCwzXoXwyF';

  static Future<List<ProductSummary>> get(String category) async {
    List<ProductSummary> products = [];
    var res;
    try {
      res = await http.get(
          Uri.parse(
              '${baseUrl}api/products?category=${Uri.encodeComponent(category)}'),
          headers: {'Accept': 'application/json'});
    } catch (e) {
      print(e);
    }

    if (res.statusCode == 200) {
      try {
        (jsonDecode(res.body) as List).forEach((element) {
          products.add(ProductSummary.fromJson(element));
        });
      } catch (e) {
        print(e);
      }
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<Product> getProduct(int id) async {
    var res;
    try {
      res = await http.get(Uri.parse('${baseUrl}api/products/$id'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tok' //TODO: get token from auth
      });
    } catch (e) {
      print(e);
    }
    if (res.statusCode == 200) {
      try {
        return Product.fromRawJson(res.body);
      } catch (e) {
        print(e);
      }
    } else {
      print(res.body);
      throw Exception('Failed to load product');
    }
  }

  static Future<bool> deleteProduct(int id) async {
    var res;
    try {
      res = await http.delete(
        Uri.parse('${baseUrl}api/products/$id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tok' //TODO: get token from auth
        },
      );

      if (res.statusCode == 200) {
        return true;
      } else {
        print(res.body);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> comment(int id, String comment) async {
    var res;
    try {
      res = await http
          .post(Uri.parse('${baseUrl}api/products/$id/comments'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tok' //TODO: get token from auth
      }, body: {
        'body': comment,
      });

      if (res.statusCode == 201) {
        return true;
      } else {
        print(res.body);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> vote(int id, String type) async {
    var res;
    try {
      res = await http
          .post(Uri.parse('${baseUrl}api/products/$id/vote'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tok' //TODO: get token from auth
      }, body: {
        'type': type,
      });

      if (res.statusCode == 200) {
        return true;
      } else {
        print(res.body);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> editProduct(int id, Map<String, String> prod) async {
    var emptyKeys = [];
    prod.keys.forEach((key) {
      if (prod[key] == '') {
        emptyKeys.add(key);
      }
    });

    emptyKeys.forEach((element) {
      prod.remove(element);
    });

    var res;
    try {
      res = await http.patch(Uri.parse('${baseUrl}api/products/$id'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $tok' //TODO: get token from auth
          },
          body: prod);

      if (res.statusCode == 200) {
        return true;
      } else {
        print(res.body);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> postProduct(Map<String, dynamic> prod) async {
    try {
      var req =
          http.MultipartRequest('POST', Uri.parse('${baseUrl}api/products'));
      req.headers.addAll({
        'Accept': 'application/json',
        'Authorization': 'Bearer $tok' //TODO: get token from auth
      });

      if (prod['image'] != null && (prod['image'] as File).existsSync()) {
        var img = http.MultipartFile.fromBytes(
            'image', await (prod['image'] as File).readAsBytes(),
            filename: (prod['image'] as File).path);
        req.files.add(img);
      }
      Map<String, String> prodMap = {
        'name': prod['name'],
        'description': prod['description'],
        'price': prod['price'].toString(),
        'category': prod['category'],
        'quantity': prod['quantity'].toString(),
        'expiry_date': prod['expiry_date'].toString(),
        'fifteen_days_discount': prod['fifteen_days_discount'].toString(),
        'thirty_days_discount': prod['thirty_days_discount'].toString(),
        'contact_info': prod['contact_info'],
      };
      if (prod['description'] == '') {
        prodMap.remove('description');
      }
      req.fields.addAll(prodMap);

      var res = await req.send();

      if (res.statusCode == 201) {
        return true;
      } else {
        print(await res.stream.bytesToString());
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static List<Category> getCategories() {
    return [
      Category(
        name: 'Canned food',
        imgName: 'images/cat1.jpg',
      ),
      Category(
        name: 'Dairy & Eggs',
        imgName: 'images/cat2.jpeg',
      ),
      Category(
        name: 'Fruits & vegetables',
        imgName: 'images/cat3.jpg',
      ),
      Category(
        name: 'Meat, Fish & Poultry',
        imgName: 'images/cat4.jpg',
      ),
      Category(
        name: 'Beverages',
        imgName: 'images/cat5.jpg',
      ),
      Category(
        name: 'Bakery & Snacks',
        imgName: 'images/cat6.jpeg',
      ),
      Category(
        name: 'Medicines & Personal Care',
        imgName: 'images/cat7.jpg',
      ),
    ];
  }
}
