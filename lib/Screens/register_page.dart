// ignore_for_file: file_names

import 'package:expiry_cart/Screens/sign_in_page.dart';
import 'package:expiry_cart/Style/app_icon.dart';
import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/Style/register.dart';
import 'package:expiry_cart/Style/register_style.dart';
import 'package:expiry_cart/Style/text_button_style.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              const Center(
                child: AppIcon(),
              ),
              const SizedBox(
                height: 60,
              ),
              UserNameStyle(),
              const SizedBox(
                height: 15,
              ),
              const EmailStyle(),
              const SizedBox(
                height: 15,
              ),
              RegisterField(
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
              RegisterField(
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
              Register(
                press: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
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
