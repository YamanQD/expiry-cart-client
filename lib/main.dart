import 'package:expiry_cart/Screens/categories_List_Page.dart';
import 'package:expiry_cart/Screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:expiry_cart/Screens/welcome_page.dart';

void main() => runApp(
      MaterialApp(
        home: Categories(),
        // SplashPage(
        //   duration: 5,
        //   navigateToPage: const WelcomePage(),
        // ),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
          ),
        ),
      ),
    );
