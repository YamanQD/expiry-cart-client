import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/Style/text_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: ClipOval(
              child: Container(
                width: 150,
                height: 150,
                color: kGreenColor,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 120,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          const Text(
            'Success',
            textAlign: TextAlign.center,
            style: kTextStyle,
          ),
          const SizedBox(
            height: 40,
          ),
          TextButtonStyle(
            text: 'Get Started',
            press: () {},
          ),
        ],
      ),
    );
  }
}
