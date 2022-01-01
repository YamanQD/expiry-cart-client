import 'dart:convert';

import 'package:expiry_cart/services/auth.dart';
import 'package:expiry_cart/categories_helper/category.dart';
import 'package:expiry_cart/models/product.dart';
import 'package:http/http.dart' as http;

class Utils {
  // categories generator
  static Future<List<ProductSummary>> get(String category) async {
    List<ProductSummary> products = [];
    var res;
    try {
      res = await http.get(
          Uri.parse(
              'http://yaman.muhajreen.net:8000/api/products?category=$category'),
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
      res = await http.get(
          Uri.parse('http://yaman.muhajreen.net:8000/api/products/$id'),
          headers: {
            'Accept': 'application/json',
            'Authorization':
                'Bearer 60|oC1JwrfZwshl3ZZ4CbL20auspr2j6UsWAWfFkKHu' //TODO: get token from auth
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
      throw Exception('Failed to load product');
    }
  }

  static List<Category> getCategories() {
    //TODO: url ecnode before sending
    return [
      Category(
        name: 'Canned Food',
        imgName: 'images/cat1.jpg',
      ),
      Category(
        name: 'Dairy & Eggs',
        imgName: 'images/cat2.jpeg',
      ),
      Category(
        name: 'Fruits%20%26%20vegetables',
        imgName: 'images/cat3.jpg',
      ),
      Category(
        name: 'Meats, Fish and Poultry',
        imgName: 'images/cat4.jpg',
      ),
      Category(
        name: 'Beverages',
        imgName: 'images/cat5.jpg',
      ),
      Category(
        name: 'Bakery%20%26%20Snacks',
        imgName: 'images/cat6.jpeg',
      ),
      Category(
        name: 'Medicines & Personal Care',
        imgName: 'images/cat7.jpg',
      ),
    ];
  }
}
