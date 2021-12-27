import 'package:expiry_cart/Screens/add_product_page.dart';
import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/Style/details_column.dart';
import 'package:expiry_cart/Style/details_container.dart';
import 'package:expiry_cart/Style/icon_press.dart';
import 'package:expiry_cart/categories_helper/products.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Products productDetail;
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
        title: const Text(
          'Product Details',
          style: kAppBarText,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(55),
            ),
            child: Stack(children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      widget.productDetail.imgName,
                    ),
                    fit: BoxFit.cover,
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
                  child: Text(widget.productDetail.name, style: kProductsName),
                ),
              ),
            ]),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12, left: 12, top: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Views:',
                                  textAlign: TextAlign.start,
                                  style: kDetailsText),
                              DetailsContainer(
                                width: 120,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Icon(Icons.remove_red_eye,
                                            color: Colors.red),
                                        Text(
                                          '1',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ]),
                                ),
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Votes:',
                                    textAlign: TextAlign.start,
                                    style: kDetailsText),
                                DetailsContainer(
                                  width: 170,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                          userVote.toString(),
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
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Price:',
                                style: kDetailsText,
                              ),
                              DetailsContainer(
                                width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.attach_money,
                                          color: Colors.green,
                                        ),
                                        Row(children: const [
                                          Text(
                                            '2000',
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          Text(
                                            'SP',
                                            style: ktext,
                                          ),
                                        ]),
                                      ]),
                                ),
                              ),
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Quantity:', style: kDetailsText),
                              DetailsContainer(
                                width: 170,
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Icon(Icons.production_quantity_limits,
                                            color: Colors.green),
                                        Text(
                                          '25',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ]),
                                ),
                              ),
                            ]),
                      ]),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Expiry Date:', style: kDetailsText),
                              DetailsContainer(
                                width: 165,
                                child: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Icon(Icons.date_range,
                                            color: Colors.green),
                                        Text('0/00/0000',
                                            style: TextStyle(fontSize: 17)),
                                      ]),
                                ),
                              )
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Contact Informations:',
                                  style: kDetailsText),
                              DetailsContainer(
                                width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Icon(Icons.phone, color: Colors.green),
                                        Text(' 9999 999 999',
                                            style: TextStyle(fontSize: 17)),
                                      ]),
                                ),
                              )
                            ])
                      ]),
                ),
                const SizedBox(height: 60),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(38),
                    topRight: Radius.circular(38),
                  ),
                  child: Container(
                    color: kGreenLightColor,
                    height: 60,
                    width: 280,
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
                                      builder: (context) =>const AddProductPage()));
                            }),
                        DetailsColumn(
                            icon: Icons.add_comment,
                            text: 'comment',
                            color: kGreenColor,
                            press: () {}),
                        DetailsColumn(
                            icon: Icons.delete,
                            text: 'Delete',
                            color: Colors.red,
                            press: () {}),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
