// ignore_for_file: file_names

import 'package:expiry_cart/Screens/signInpage.dart';
import 'package:expiry_cart/Style/appIcon.dart';
import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/Style/rigister.dart';
import 'package:expiry_cart/Style/rigisterStyle.dart';
import 'package:expiry_cart/Style/textButtonStyle.dart';
import 'package:flutter/material.dart';

class RigisterPage extends StatefulWidget {
  @override
  _RigisterPageState createState() => _RigisterPageState();
}

class _RigisterPageState extends State<RigisterPage> {
  bool visibilty = true;
  bool confi_visibilty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: AppIcon(),
              ),
              const SizedBox(
                height: 60,
              ),
              UserNameStyle(),
              const SizedBox(
                height: 15,
              ),
              EmailStyle(),
              const SizedBox(
                height: 15,
              ),
              RigisterField(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Icon(
                        Icons.lock,
                        color: kGreenColor,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        visibilty ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          visibilty = !visibilty;
                        });
                      },
                    ),
                    border: InputBorder.none,
                  ),
                  obscureText: visibilty,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RigisterField(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Re-Enter Password",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Icon(
                        Icons.lock,
                        color: kGreenColor,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        confi_visibilty
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          confi_visibilty = confi_visibilty;
                        });
                      },
                    ),
                    border: InputBorder.none,
                  ),
                  obscureText: confi_visibilty,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButtonStyle(
                text: 'Sign Up',
                press: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              Rigister(
                press: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ),
                  );
                },
                accountext: 'Already have have an Account?',
                text: 'Sign In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
