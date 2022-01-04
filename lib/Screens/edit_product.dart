import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/categories_helper/utils.dart';
import 'package:flutter/material.dart';

class EditProductPage extends StatefulWidget {
  int id;
  EditProductPage({Key key, @required this.id}) : super(key: key);

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final _quantityController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _quantityController.dispose();
    _phoneNumberController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 175),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Edit Product',
                style: kEditText,
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                decoration: kAddDecoration,
                height: 55,
                margin: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      hintText: "  Product Description ",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.short_text_rounded,
                        color: kGreenColor,
                      ),
                      border: InputBorder.none),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 55,
                decoration: kAddDecoration,
                margin: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _quantityController,
                  decoration: const InputDecoration(
                    hintText: "  Available quantity ",
                    hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                    prefixIcon:
                        Icon(Icons.add_shopping_cart, color: kGreenColor),
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 55,
                decoration: kAddDecoration,
                margin: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                      prefixText: "+963",
                      prefixStyle: TextStyle(color: Colors.black, fontSize: 20),
                      hintText: "phone number",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                      prefixIcon: Icon(Icons.phone, color: kGreenColor),
                      border: InputBorder.none),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
                height: 55,
                width: 180,
                decoration: kEditDecoration,
                child: TextButton(
                    onPressed: () async {
                      if (await Utils.editProduct(widget.id, {
                        'description': _descriptionController.text,
                        'quantity': _quantityController.text,
                        'contact_info': _phoneNumberController.text,
                      })) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
          ],
        ),
      ),
    );
  }
}
