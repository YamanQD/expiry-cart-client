import 'package:expiry_cart/Style/constant.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final String accountext;
  final String text;
  final Function press;
  const Register({
    Key key,
    @required this.press,
    @required this.accountext,
    @required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(accountext),
        TextButton(
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
