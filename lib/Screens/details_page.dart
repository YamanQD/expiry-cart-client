import 'package:expiry_cart/categories_helper/products.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
   final Products productDetail;
   const DetailsPage({
    Key key,
    @required this.productDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(productDetail.name),
      ),
    );
  }
}
