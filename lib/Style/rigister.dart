import 'package:expiry_cart/Style/constant.dart';
import 'package:flutter/material.dart';

class Rigister extends StatelessWidget {
  final String accountext;
  final String text;
  final Function press;
  Rigister({
    @required this.press,
    @required this.accountext,
    @required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(accountext),
        FlatButton(
          onPressed: press,
          child: Text(
            text,
            style: const TextStyle(
              color: kGreenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
