// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Container(
          width: 150,
          height: 150,
          color: Colors.white,
          alignment: Alignment.topCenter,
          child: Image.asset(
            'images/icon.png',
          ),
        ),
      ),
    );
  }
}