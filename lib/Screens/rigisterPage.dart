// ignore_for_file: file_names

import 'package:expiry_cart/Style/appIcon.dart';
import 'package:expiry_cart/Style/inputField.dart';
import 'package:flutter/material.dart';

class RigisterPage extends StatefulWidget {
  @override
  _RigisterPageState createState() => _RigisterPageState();
}

class _RigisterPageState extends State<RigisterPage> {
  bool visibilty = true;
  bool confi_visibilty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: AppIcon(),
          ),
          const SizedBox(
            height: 30,
          ),
          const InputField(
            hintText: 'username',
            icon: Icons.person,
          ),
          
        ],
      ),
    );
  }
}
