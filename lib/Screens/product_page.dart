import 'package:expiry_cart/Screens/search.dart';
import 'package:expiry_cart/models/product.dart';
import 'package:expiry_cart/Screens/details_page.dart';
import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/categories_helper/category.dart';
import 'package:expiry_cart/categories_helper/utils.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  final Category selected;

  const ProductsPage({Key key, @required this.selected}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  Future<void> _reload() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.selected.name + ' ' + 'Category',
          style: kAppBarText,
        ),
        iconTheme: const IconThemeData(
          color: kGreenColor,
        ),
        actions: [
          IconButton(

              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchView()));
              },
              icon: const Icon(Icons.search)),
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
      
      body: FutureBuilder(
          future: Utils.get(widget.selected.name),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return RefreshIndicator(
                  onRefresh: _reload,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      (snapshot.data as List).length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextButton(
                            onPressed: () {
                              print('asfassa' +
                                  snapshot.data[index].id.toString());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    productId: snapshot.data[index].id,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      '${Utils.baseUrl}images/products/${snapshot.data[index].image}',
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
                                          style: const TextStyle(
                                              color: Colors.grey)),
                                      Text(snapshot.data[index].price,
                                          style: const TextStyle(
                                              color: Colors.grey)),
                                    ],

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
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text(snapshot.data[index].price,
                                            style:
                                                TextStyle(color: Colors.grey)),
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
