import 'package:flutter/material.dart';

class IconPress extends StatelessWidget {
  final IconData icon;
  final Function press;
  final Color color;
  const IconPress({
    Key key,
    @required this.icon,
    @required this.press,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 30,
        height: 30,
      ),
      shape: const CircleBorder(),
      onPressed: press,
      child: Icon(
        icon,
        size: 25,
        color: color,
      ),
    );
  }
}
