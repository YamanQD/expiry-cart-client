import 'package:expiry_cart/Screens/add_product_page.dart';
import 'package:expiry_cart/Screens/categories_list_page.dart';
import 'package:expiry_cart/Screens/details_page.dart';
import 'package:expiry_cart/Screens/edit_product.dart';
import 'package:expiry_cart/categories_helper/category.dart';
// import 'package:expiry_cart/Screens/splash_page.dart';
import 'package:expiry_cart/categories_helper/utils.dart';
import 'package:expiry_cart/Screens/product_page.dart';
import 'package:flutter/material.dart';
// import 'package:expiry_cart/Screens/welcome_page.dart';

void main() => runApp(
      MaterialApp(
        // AddProductPage(),
        home: 
        // EditProductPage(),
          Categories(),
          // ProductsPage(selected: Utils.getCategories()[2]),
        // SplashPage(
        //  duration: 5,
        //  navigateToPage: const WelcomePage(),
        //  ),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
          ),
        ),
      ),
    );
