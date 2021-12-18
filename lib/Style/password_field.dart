// ignore_for_file: file_names

import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/Style/text_field_container.dart';
import 'package:flutter/material.dart';

class Passwordfield extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TextFieldContainer(
      child: TextField(
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
    );
  }
}
