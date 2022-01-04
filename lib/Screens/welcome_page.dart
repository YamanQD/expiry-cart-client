import 'package:expiry_cart/Screens/sign_in_page.dart';
import 'package:expiry_cart/Screens/categories_list_page.dart';
import 'package:expiry_cart/Style/app_icon.dart';
import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/Style/text_button_style.dart';
import 'package:expiry_cart/services/auth.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

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
                  const Center(
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
                    text: 'Get Started',
                    press: () async {
                      if (await Auth.useTokenFromStorage()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Categories(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      }
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
