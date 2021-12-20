// ignore_for_file: file_names
import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/categories_helper/category.dart';
import 'package:expiry_cart/categories_helper/utils.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final List<Category> categories = Utils.get();
  Categories({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Categories',
            style: kTextStyle,
          ),
        ),
        iconTheme: const IconThemeData(
          color: kGreenColor,
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Select a Category',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
