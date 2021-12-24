// ignore_for_file: file_names

import 'package:expiry_cart/Style/app_icon.dart';
import 'package:expiry_cart/Style/category_card.dart';
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
      // drawer: const Drawer(),
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: kTextStyle,
        ),
        iconTheme: const IconThemeData(
          color: kGreenColor,
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Select a Category',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'IBM Plex Sans',
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      categories: categories,
                      categoryImage: categories[index].imgName,
                      categoryName: categories[index].name,
                      press: () {},
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset.zero,
                  ),
                ],
              ),
              height: 70,
              child: Row(
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
