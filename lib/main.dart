// import 'package:expiry_cart/Screens/categories_list_page.dart';
import 'package:expiry_cart/Screens/details_page.dart';
// import 'package:expiry_cart/Screens/splash_page.dart';
import 'package:expiry_cart/categories_helper/utils.dart';
import 'package:flutter/material.dart';
// import 'package:expiry_cart/Screens/welcome_page.dart';

void main() => runApp(
      MaterialApp(
        home: DetailsPage(productDetail: Utils.get()[0].subCategories[0]),
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
