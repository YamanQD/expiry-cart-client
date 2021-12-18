import 'package:expiry_cart/Screens/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:expiry_cart/Screens/welcomePage.dart';

void main() => runApp(MaterialApp(
      home: SplashPage(
        duration: 5,
        navigateToPage: WelcomePage(),
      ),
    ));
