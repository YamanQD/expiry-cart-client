import 'package:expiry_cart/Style/constant.dart';
import 'package:flutter/material.dart';

class IconStyle extends StatefulWidget {
  final Function press;
  final IconData icon;
  const IconStyle({
    Key key,
    @required this.press,
    @required this.icon,
  }) : super(key: key);

  @override
  State<IconStyle> createState() => _IconStyleState();
}

class _IconStyleState extends State<IconStyle> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.press,
      child: Icon(
        widget.icon,
        color: kGreenColor,
        size: 30,
      ),
    );
  }
}