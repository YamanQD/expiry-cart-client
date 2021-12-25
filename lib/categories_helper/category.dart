import 'package:flutter/material.dart';

class Category {
  String name;
  String imgName;
  List<Category> subCategories;
  Category({
    @required this.name,
    @required this.imgName,
    this.subCategories,
  });
}
