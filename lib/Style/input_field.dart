// ignore_for_file: file_names

import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/Style/text_field_container.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Function ontap;
  const InputField({
    Key key,
    @required this.hintText,
    @required this.icon,
    @required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: GestureDetector(
        child: TextField(
          onChanged: ontap,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Icon(
                icon,
                color: kGreenColor,
              ),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
