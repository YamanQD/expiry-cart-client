import 'package:expiry_cart/models/product.dart';
import 'package:expiry_cart/Screens/details_page.dart';
import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/categories_helper/category.dart';
import 'package:expiry_cart/categories_helper/utils.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final Category selected;

  ProductsPage({Key key, @required this.selected}) : super(key: key);

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
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            press: () {},
          ),
          PopupMenuButton(
              icon: const Icon(Icons.sort),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      child: TextButton(
                          child: const Text('Sort by name',
                              style: TextStyle(color: Colors.grey)),
                          onPressed: () {}),
                    ),
                    PopupMenuItem(
                      child: TextButton(
                          child: const Text('Sort by price',
                              style: TextStyle(color: Colors.grey)),
                          onPressed: () {}),
                    ),
                    PopupMenuItem(
                      child: TextButton(
                          child: const Text('Sort by date',
                              style: TextStyle(color: Colors.grey)),
                          onPressed: () {}),
                    ),
                  ]),
        ],
      ),
      body: FutureBuilder(
          future: Utils.get(selected.name),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    (snapshot.data as List).length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  productDetail:
                                      Utils.getProduct(snapshot.data[index].id),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 8, bottom: 2),
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
                                  child: Image.network(
                                    'http://yaman.muhajreen.net:8000/images/products/${snapshot.data[index].image}',
                                    fit: BoxFit.cover,
                                    width: 90,
                                    height: 90,
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
                                  snapshot.data[index].name,
                                  style: kProductName,
                                ),
                                // const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(snapshot.data[index].expiryDate,
                                          style: TextStyle(color: Colors.grey)),
                                      Text(snapshot.data[index].price,
                                          style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text('No Data'),
                );
              }
            } else {
              if (snapshot.hasError) print(snapshot.error);
              return const Center(
                child: CircularProgressIndicator(
                  color: kGreenColor,
                ),
              );
            }
          }),
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
