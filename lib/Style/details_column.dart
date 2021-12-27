import 'package:flutter/material.dart';

class DetailsColumn extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Function press;
  const DetailsColumn({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.color,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
