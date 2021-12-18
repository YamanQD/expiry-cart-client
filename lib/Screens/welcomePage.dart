import 'package:expiry_cart/Screens/signInPage.dart';
import 'package:expiry_cart/Style/appIcon.dart';
import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/Style/textButtonStyle.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  'images/background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: AppIcon(),
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  const Text(
                    'Expiry Cart',
                    style: kExpiryCartStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    'Welcome to Expiry Cart.\n For Fun & Easy Shopping',
                    style: kWelcomeText,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextButtonStyle(
                    text: 'Sign In',
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
