// ignore_for_file: file_names

import 'package:expiry_cart/Style/constant.dart';
import 'package:flutter/material.dart';

class EmailStyle extends StatelessWidget {
  TextEditingController controller;

  EmailStyle({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegisterField(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: "Enter your Email",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          icon: Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Icon(
              Icons.email,
              color: kGreenColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class UserNameStyle extends StatelessWidget {
  TextEditingController controller;

  UserNameStyle({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegisterField(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: "Enter username",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          icon: Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Icon(
              Icons.person,
              color: kGreenColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RegisterField extends StatelessWidget {
  final Widget child;

  const RegisterField({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: kGreenLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
