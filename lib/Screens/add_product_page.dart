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
  // name , phone , price , quantity
  String _ProductName, _Phone_Number, _Price, _Quantity;
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  static final RegExp numberRegExp = RegExp(r'\d');

  final GlobalKey<FormState> _formKey = GlobalKey();

  //  add product image
  File _imageFile;
  final ImagePicker _picker = ImagePicker();
  void _pickImage(ImageSource src) async {
    final pickedImageFile = await _picker.getImage(source: src);
    if (pickedImageFile != null) {
      setState(() {
        _imageFile = File(pickedImageFile.path);
      });
    } else {
      print(" No Image Selected ");
    }
  }

  //         select product type
  var ProductChosse;
  final List<String> listItem = [
    "Canned & Food",
    "Dairy & Eggs",
    "Fruits & Vegetables",
    "Meat , Fish & Poultry",
    "Beverages",
    "Bakery & Snacks",
    "Medicines & Persona Care"
  ];

  // Expiration date
  DateTime _dateTime = DateTime.now();
  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.utc(2022, 12, 31),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
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
        title: const Text("  Add product "),
        backgroundColor: const Color(0xff77b234),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          // add image
          const SizedBox(
            height: 8,
          ),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            backgroundImage: _imageFile != null ? FileImage(_imageFile) : null,
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
            height: 8,
          ),
          // select product
          DropdownButtonFormField(
            icon: const Icon(Icons.arrow_drop_down),
            dropdownColor: const Color(0xFFFFFFFF),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50))),
            hint: const Text(
              '   Select product type  ',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            isExpanded: true,
            //  underline :true,
            value: ProductChosse,
            onChanged: (newValue) {
              setState(() {
                ProductChosse = newValue;
                validator:
                (newValue) => newValue == null ? 'field required' : null;
              });
            },
            items: listItem.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem),
              );
            }).toList(),
          ),
          // product name
          Container(
            color: const Color(0xFFFFFFFF),
            margin: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: "  Product name",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  prefixIcon: Icon(Icons.add_box_sharp)),
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              // validator:  (val) {
              //   if (val.isEmpty || double.parse(val) > 0){
              //     return " Invalid name ";
              //   }return null;
              //
              //  },
              validator: (value) => value.isEmpty
                  ? 'Enter Your Name'
                  : (nameRegExp.hasMatch(value) ? null : 'Enter a Valid Name'),
              onSaved: (String name) {
                _ProductName = name;
                print(_ProductName);
              },
            ),
          ),
          // phone number
          Container(
            color: const Color(0xFFFFFFFF),
            margin: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                prefixText: "  +963   ",
                prefixStyle: TextStyle(color: Colors.black, fontSize: 20),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(color: Colors.black)),
                labelText: "  phone number ",
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.length == 0) {
                  return 'Please enter mobile number';
                } else if (value.length != 10) {
                  return 'Please enter valid mobile number';
                }
                return null;
              },
              onSaved: (value) {
                _Phone_Number = value;
                print(_Phone_Number);
              },
            ),
          ),
          // product price
          Container(
            color: const Color(0xFFFFFFFF),
            margin: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: "  Product price ",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  prefixIcon: Icon(Icons.attach_money),
                  suffixText: " S.P             "),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              validator: (String value) {
                double _parsedValue = double.tryParse(value);
                if (_parsedValue == null) {
                  return "Please input a valid price";
                }
                if (_parsedValue == 0.0) {
                  return "Please input a valid price";
                }
                if (double.parse(value) <= 0) {
                  return "Please input a valid price";
                }
              },
              onSaved: (value) {
                _Price = value;
                print(_Price);
              },
            ),
          ),
          // quantity
          Container(
            color: const Color(0xFFFFFFFF),
            margin: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(color: Colors.black)),
                labelText: "  Available quantity ",
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                prefixIcon: Icon(Icons.add_shopping_cart),
              ),
              textAlign: TextAlign.left,
              keyboardType: TextInputType.number,
              validator: (String value) {
                double _parsedValue = double.tryParse(value);
                if (_parsedValue == null) {
                  return "Please input a valid quantity";
                }
                if (_parsedValue == 0.0) {
                  return "Please input a valid quantity";
                }
                if (double.parse(value) <= 0) {
                  return "Please input a valid quantity";
                }
              },
              onSaved: (value) {
                _Quantity = value;
                print(_Quantity);
              },
            ),
          ),
          // expiration date   ElevatedButton
          Container(
            margin: const EdgeInsets.only(
                left: 0.0, top: 1.0, right: 0.0, bottom: 1.0),
            color: const Color(0x0fffffff),
            child: RaisedButton(
              child: Text(
                  'Expiration date : ${_dateTime.year}-${_dateTime.month}-${_dateTime.day}'),
              onPressed: _datePicker,
            ),
          ),
          RaisedButton(
            child: const Text(" Add product "),
            onPressed: _submit,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
            color: Theme.of(context).primaryTextTheme.button.color,
          ),

          const SizedBox(height: 40),
        ]),
      )),
    );
  }

  void _submit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('_ProductName', _ProductName));
  }
}
