import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/categories_helper/utils.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:core';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discount1Controller = TextEditingController();
  TextEditingController discount2Controller = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  static final RegExp numberRegExp = RegExp(r'\d');

  final GlobalKey<FormState> _formKey = GlobalKey();

//  add product image

  File _imageFile;
  final ImagePicker _picker = ImagePicker();

  void _pickImage(ImageSource src) async {
    final pickedImageFile = await _picker.pickImage(source: src);
    if (pickedImageFile != null) {
      setState(() {
        _imageFile = File(pickedImageFile.path);
      });
    } else {
      print(" No Image Selected ");
    }
  }

  @override
  void dispose() {
    productNameController.dispose();
    descriptionController.dispose();
    phoneNumberController.dispose();
    priceController.dispose();
    discount1Controller.dispose();
    discount2Controller.dispose();
    quantityController.dispose();
    super.dispose();
  }

//         select product type
  var ProductChosse;

  final List<String> listItem = [
    "Canned food",
    "Dairy & Eggs",
    "Fruits & vegetables",
    "Meat, Fish & Poultry",
    "Beverages",
    "Bakery & Snacks",
    "Medicines & Personal Care"
  ];

// Expiration date

  DateTime _dateTime = DateTime.now();

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _dateTime = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: const Text(" Add new product ",
            style: TextStyle(fontSize: 24, color: kGreenColor)),
        // backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: kGreenColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
// add image
              const SizedBox(
                height: 9,
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                backgroundImage:
                    _imageFile != null ? FileImage(_imageFile) : null,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton.icon(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () => _pickImage(ImageSource.camera),
                    icon: const Icon(Icons.photo_camera_outlined),
                    label: const Text(
                      'Add product Image\nfrom Camera',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FlatButton.icon(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () => _pickImage(ImageSource.gallery),
                    icon: const Icon(Icons.image_outlined),
                    label: const Text(
                      'Add product Image\nfrom gallery',
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 4,
              ),

// select product
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 10, bottom: 10),
                child: DropdownButtonFormField(
                  elevation: 10,
                  icon: const Icon(Icons.arrow_drop_down),
                  dropdownColor: const Color(0xFFFFFFFF),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                  hint: const Text(
                    '   Select product type',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  isExpanded: true,
                  value: ProductChosse,
                  onChanged: (newValue) {
                    setState(() {
                      ProductChosse = newValue;
                    });
                  },
                  validator: (newValue) =>
                      newValue == null ? 'Please select product type ' : null,
                  items: listItem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),

              // product name
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 55,
                  decoration: kAddDecoration,
                  margin: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "  Product name",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.add_box_sharp,
                        color: kGreenColor,
                      ),
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    validator: (value) => value.isEmpty
                        ? 'Enter Your Name'
                        : (nameRegExp.hasMatch(value)
                            ? null
                            : 'Enter a Valid Name'),
                    controller: productNameController,
                  ),
                ),
              ),

              // description

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: kAddDecoration,
                  height: 55,
                  margin: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        // enabledBorder: OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        //     borderSide: BorderSide(color: Colors.black)),
                        hintText: "  Product Description ",
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.short_text_rounded,
                          color: kGreenColor,
                        ),
                        border: InputBorder.none),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    controller: descriptionController,
                  ),
                ),
              ),

              // phone number

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 55,
                  decoration: kAddDecoration,
                  margin: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        prefixText: "+963",
                        prefixStyle:
                            TextStyle(color: Colors.black, fontSize: 20),
                        hintText: "phone number",
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                        prefixIcon: Icon(Icons.phone, color: kGreenColor),
                        border: InputBorder.none),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.length == 0) {
                        return 'Please enter mobile number';
                      } else if (value.length != 9) {
                        return 'Please enter valid mobile number';
                      }
                      return null;
                    },
                    controller: phoneNumberController,
                  ),
                ),
              ),

// product price

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 55,
                  decoration: kAddDecoration,
                  margin: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Product price",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                      prefixIcon: Icon(Icons.attach_money, color: kGreenColor),
                      suffixText: " S.P      ",
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    validator: (String value) {
                      double _parsedValue = double.tryParse(value);
                      if (_parsedValue == null) {
                        return "Please enter a valid price";
                      }
                      if (_parsedValue == 0.0) {
                        return "Please enter a valid price";
                      }
                      if (double.parse(value) <= 0) {
                        return "Please enter a valid price";
                      }
                    },
                    controller: priceController,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 55,
                  decoration: kAddDecoration,
                  margin: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: "  30 days discount ",
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.analytics_outlined,
                          color: kGreenColor,
                        ),
                        suffixText: " % ",
                        border: InputBorder.none),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    validator: (String value) {
                      double _parsedValue = double.tryParse(value);
                      if (_parsedValue == null) {
                        return "Please enter a valid discount ";
                      }
                      if (double.parse(value) <= 0) {
                        return "Please enter a valid discount";
                      }
                      if (double.parse(value) > 100) {
                        return "Please enter a valid discount";
                      }
                    },
                    controller: discount1Controller,
                  ),
                ),
              ),
// quantity
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 55,
                  decoration: kAddDecoration,
                  margin: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "  15 days discount ",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.analytics_outlined,
                        color: kGreenColor,
                      ),
                      suffixText: " %",
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    validator: (String value) {
                      double _parsedValue = double.tryParse(value);
                      if (_parsedValue == null) {
                        return "Please enter a valid discount ";
                      }
                      if (double.parse(value) <= 0) {
                        return "Please enter a valid discount";
                      }
                      if (double.parse(value) > 100) {
                        return "Please enter a valid discount";
                      }
                    },
                    controller: discount2Controller,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 55,
                  decoration: kAddDecoration,
                  margin: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "  Available quantity ",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                      prefixIcon:
                          Icon(Icons.add_shopping_cart, color: kGreenColor),
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    validator: (String value) {
                      double _parsedValue = double.tryParse(value);
                      if (_parsedValue == null) {
                        return "Please enter a valid quantity";
                      }
                      if (_parsedValue == 0.0) {
                        return "Please enter a valid quantity";
                      }
                      if (double.parse(value) <= 0) {
                        return "Please enter a valid quantity";
                      }
                      if (double.parse(value) > 1000) {
                        return "Please enter a valid quantity";
                      }
                    },
                    controller: quantityController,
                  ),
                ),
              ),

              // expiration date   ElevatedButton

              Container(
                margin: const EdgeInsets.only(
                    left: 0.0, top: 1.0, right: 0.0, bottom: 1.0),
                child: RaisedButton(
                  color: kGreenColor,
                  child: Text(
                      'Expiration date  :        ${_dateTime.year}/${_dateTime.month}/${_dateTime.day}',
                      style: const TextStyle(
                        backgroundColor: Color(0xff77b234),
                      )),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: _datePicker,
                ),
              ),
              RaisedButton(
                color: kGreenColor,
                child: const Text("Add product"),
                onPressed: _submit,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    Map<String, dynamic> prod = {
      "name": productNameController.text,
      "category": ProductChosse,
      "description": descriptionController.text,
      "contact_info": phoneNumberController.text,
      "price": priceController.text,
      "fifteen_days_discount": discount2Controller.text,
      "thirty_days_discount": discount1Controller.text,
      "quantity": quantityController.text,
      "expiry_date": _dateTime,
      "image": _imageFile,
    };
    print('date time ' + _dateTime.toString());
    bool success = await Utils.postProduct(prod);
    if (success) {
      Navigator.pop(context);
    } else {
      throw Exception('Failed to add product');
    }
  }
}
