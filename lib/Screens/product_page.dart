import 'package:expiry_cart/Screens/details_page.dart';
import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/categories_helper/category.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final Category selected;

  const ProductsPage({Key key, @required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selected.name + ' ' + 'Category',
          style: kAppBarText,
        ),
        iconTheme: const IconThemeData(
          color: kGreenColor,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            press: () {},
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          selected.subCategories.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        productDetail: selected.subCategories[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          selected.subCategories[index].imgName,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                        width: 150.0,
                        child: Divider(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Text(
                        selected.subCategories[index].name,
                        style: kProductName,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final Widget icon;
  final Function press;
  const IconButton({
    Key key,
    @required this.icon,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 30,
        height: 30,
      ),
      fillColor: Colors.white,
      child: icon,
      onPressed: press,
    );
  }
}
