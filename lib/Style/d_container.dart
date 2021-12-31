import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/Style/details_container.dart';
import 'package:flutter/material.dart';

class D_Container extends StatelessWidget {
  final String text;
  final IconData icon;
  final String text1;
  final double height;
  const D_Container({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.text1, this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: kDetailsText,
          ),
          DetailsContainer(
            width: 270,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, color: kGreenColor),
                  Text(text1, style: const TextStyle(fontSize: 17)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
