import 'package:expiry_cart/Screens/edit_product.dart';
import 'package:expiry_cart/models/product.dart';
import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/Style/d_container.dart';
import 'package:expiry_cart/Style/details_column.dart';
import 'package:expiry_cart/Style/details_container.dart';
import 'package:expiry_cart/Style/icon_press.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  Future<Product> productDetail;
  DetailsPage({
    Key key,
    @required this.productDetail,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int userVote = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details', style: kAppBarText),
        iconTheme: const IconThemeData(
          color: kGreenColor,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
            future: widget.productDetail,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(55),
                        ),
                        child: Stack(children: [
                          Container(
                            height: 175,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://yaman.muhajreen.net:8000/images/products/${snapshot.data.image}'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                    Colors.black.withOpacity(0.6),
                                    Colors.transparent
                                  ])),
                            ),
                          ),
                          Positioned(
                            bottom: 0.3,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(snapshot.data.name,
                                  style: kProductsName),
                            ),
                          ),
                        ])),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 12, left: 15, top: 8),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Views:',
                                            textAlign: TextAlign.start,
                                            style: kDetailsText),
                                        DetailsContainer(
                                          width: 150,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Icon(
                                                      Icons.remove_red_eye,
                                                      color: Colors.red),
                                                  Text(
                                                    snapshot.data.views,
                                                    style: const TextStyle(
                                                        fontSize: 17),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ]),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Votes:',
                                              textAlign: TextAlign.start,
                                              style: kDetailsText),
                                          DetailsContainer(
                                            width: 180,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconPress(
                                                    icon: Icons.arrow_upward,
                                                    press: () {
                                                      setState(() {
                                                        userVote++;
                                                      });
                                                    },
                                                    color: kGreenColor,
                                                  ),
                                                  Text(
                                                    snapshot.data.votes,
                                                    style: const TextStyle(
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                  IconPress(
                                                    icon: Icons.arrow_downward,
                                                    press: () {
                                                      setState(() {
                                                        userVote--;
                                                      });
                                                    },
                                                    color: Colors.red,
                                                  ),
                                                ]),
                                          ),
                                        ]),
                                  ),
                                ]),
                          ),
                          const SizedBox(height: 10),
                          D_Container(
                              text: 'Price:',
                              icon: Icons.attach_money,
                              text1: snapshot.data.price),
                          const SizedBox(height: 7),
                          D_Container(
                              text: 'Quantity:',
                              icon: Icons.production_quantity_limits,
                              text1: snapshot.data.quantity),
                          const SizedBox(height: 7),
                          D_Container(
                              text: 'Expiry Date:',
                              icon: Icons.date_range,
                              text1: snapshot.data.expiryDate),
                          const SizedBox(height: 7),
                          D_Container(
                              text: 'Contact Information:',
                              icon: Icons.phone,
                              text1: snapshot.data.contactInfo),
                          D_Container(
                              text: 'Description:',
                              icon: Icons.short_text_rounded,
                              text1: snapshot.data.description),
                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: kGreenLightColor,
                                borderRadius: BorderRadius.circular(25)),
                            width: 350,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DetailsColumn(
                                    icon: Icons.edit,
                                    text: 'Edit',
                                    color: kGreenColor,
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EditProductPage()));
                                    }),
                                DetailsColumn(
                                    icon: Icons.add_comment,
                                    text: 'Comment',
                                    color: kGreenColor,
                                    press: () {
                                      
                                    }),
                                DetailsColumn(
                                    icon: Icons.delete,
                                    text: 'Delete',
                                    color: Colors.red,
                                    press: () {
                                      showAlertDialog(context);
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ]);
                } else {
                  return const Center(
                    child: Text('No Data'),
                  );
                }
              } else {
                return const CircularProgressIndicator(
                  color: kGreenColor,
                );
              }
            }),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Delete", style: TextStyle(color: Colors.red)),
    onPressed: () {
      //     Future<void> Delete_Product(String product_name) async{
      //   productsList.removeWhere((element) => element.product_name == product_name);
      print(" product delete ");
      // }
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text(
      "Delete this Product",
      style: TextStyle(color: kGreenColor),
    ),
    content: const Text("Do you want to delete this product?"),
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
