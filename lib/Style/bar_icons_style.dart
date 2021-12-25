import 'package:expiry_cart/Style/constant.dart';
import 'package:flutter/material.dart';

class IconStyle extends StatelessWidget {
  final Function press;
  final IconData icon;
  const IconStyle({
    Key key,
    @required this.press,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Icon(
        icon,
        color: kGreenColor,
        size: 30,
      ),
    );
  }
}