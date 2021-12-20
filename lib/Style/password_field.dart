// ignore_for_file: file_names

import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/Style/text_field_container.dart';
import 'package:flutter/material.dart';

class Passwordfield extends StatelessWidget {
  final Function optap;
  const Passwordfield({Key key,@required this.optap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFieldContainer(
      child: GestureDetector (
        onTap: optap,
        child:const TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            icon: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Icon(
                Icons.lock,
                color: kGreenColor,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
