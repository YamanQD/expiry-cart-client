// ignore_for_file: file_names

import 'package:expiry_cart/Style/constant.dart';
import 'package:flutter/material.dart';

class TextButtonStyle extends StatelessWidget {
  final String text;
  final Function press;
  const TextButtonStyle({Key key, @required this.text, @required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(25),
          backgroundColor: kGreenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: press,
        child: Text(
          text,
          style: kSignInStyle,
        ),
      ),
    );
  }
}
