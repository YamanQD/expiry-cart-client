import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/categories_helper/category.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Function press;
  final String categoryName;
  final String categoryImage;
  const CategoryCard({
    Key key,
    @required this.categories,
    @required this.categoryName,
    @required this.categoryImage,
    @required this.press,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Container(
        margin: const EdgeInsets.only(right: 18, left: 18, top: 5, bottom: 2),
        height: 160,
        child: Stack(
          children: [
            CategoryImage(
              categories: categories,
              categoryImage: categoryImage,
            ),
            CategoryName(
              categories: categories,
              categoryName: categoryName,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryName extends StatelessWidget {
  final String categoryName;
  const CategoryName({
    Key key,
    @required this.categories,
    @required this.categoryName,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.3,
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Text(
          categoryName,
          style: kCategoriesName,
        ),
      ),
    );
  }
}

class CategoryImage extends StatelessWidget {
  final String categoryImage;
  const CategoryImage({
    Key key,
    @required this.categories,
    @required this.categoryImage,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: Container(
          color: Colors.black,
          child: Opacity(
            opacity: 0.6,
            child: Image.asset(
              categoryImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
