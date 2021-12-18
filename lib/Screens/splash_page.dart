import 'package:expiry_cart/Style/app_icon.dart';
import 'package:expiry_cart/Style/constant.dart';
import 'package:flutter/material.dart';

//splash page has a duration of 5 sec and will move to welcome page.
class SplashPage extends StatelessWidget {
  int duration = 0;
  final Widget navigateToPage;

  SplashPage({Key key, final this.navigateToPage, this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => navigateToPage,
        ),
      );
    });
    return Scaffold(
      body: Container(
        color: kGreenColor,
        alignment: Alignment.center,
        child: const AppIcon(),
      ),
    );
  }
}
