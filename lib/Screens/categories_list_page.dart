import 'package:expiry_cart/Screens/add_product_page.dart';
import 'package:expiry_cart/Screens/product_page.dart';
import 'package:expiry_cart/Screens/sign_in_page.dart';
import 'package:expiry_cart/Style/bar_icons_style.dart';
import 'package:expiry_cart/Style/category_card.dart';
import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/categories_helper/category.dart';
import 'package:expiry_cart/categories_helper/utils.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  Categories({Key key}) : super(key: key);
  List<Category> categories = Utils.getCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                padding: EdgeInsets.all(8),
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
                  padding: const EdgeInsets.only(
                    bottom: 80,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      categories: categories,
                      categoryImage: categories[index].imgName,
                      categoryName: categories[index].name,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductsPage(
                              selected: categories[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          const BottomBar(),
        ],
      ),
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
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
        child: ClipOval(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconStyle(press: () {}, icon: Icons.home),
              IconStyle(
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddProductPage()));
                  },
                  icon: Icons.add_circle),
              IconStyle(
                  press: () {
                    showAlertDialog(context);
                  },
                  icon: Icons.logout),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: const Text("No", style: TextStyle(color: Colors.grey)),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Yes", style: TextStyle(color: Colors.red)),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignIn()));
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text(
      "Logout",
      style: TextStyle(color: kGreenColor),
    ),
    content: const Text("Are you sure that you want to logout?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
