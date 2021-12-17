//@dart=2.9
import 'package:expiry_cart/Screens/splashpage.dart';
import 'package:flutter/material.dart';
import 'package:expiry_cart/Screens/welcomepage.dart';

void main() => runApp(MaterialApp(
      home: SplashPage(
        duration: 5,
        navigateToPage: WelcomePage(),
      ),
    ));

