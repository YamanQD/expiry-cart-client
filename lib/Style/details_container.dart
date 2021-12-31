import 'package:expiry_cart/Style/constant.dart';
import 'package:flutter/material.dart';

class DetailsContainer extends StatelessWidget {
  final Widget child;
  final double width;
  const DetailsContainer({
    Key key,
    @required this.child,
    @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(38),
        bottomRight: Radius.circular(38),
        topRight: Radius.circular(38),
      ),
      child: Container(
        color: kGreenLightColor,
        height: 45,
        width: width,
        child: child,
      ),
    );
  }
}
