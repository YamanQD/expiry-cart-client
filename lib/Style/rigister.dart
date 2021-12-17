import 'package:expiry_cart/Style/constant.dart';
import 'package:flutter/material.dart';

class Rigister extends StatelessWidget {
  final Function press;
   Rigister({@required this.press});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an Account?'),
        FlatButton(
          onPressed: press,
          child: const Text(
            'Rigister NOW',
            style: TextStyle(
              color: kGreenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
