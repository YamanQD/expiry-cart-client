// ignore_for_file: file_names

import 'package:expiry_cart/Style/constant.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: kGreenLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}