// ignore_for_file: file_names

import 'package:expiry_cart/Screens/sign_in_page.dart';
import 'package:expiry_cart/Screens/success_page.dart';
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
  bool passwordVisibility = true;
  bool confirmationVisibility = true;
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
              const UserNameStyle(),
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
                        passwordVisibility
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisibility = !passwordVisibility;
                        });
                      },
                    ),
                    border: InputBorder.none,
                  ),
                  obscureText: passwordVisibility,
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
                        confirmationVisibility
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          confirmationVisibility = !confirmationVisibility;
                        });
                      },
                    ),
                    border: InputBorder.none,
                  ),
                  obscureText: confirmationVisibility,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButtonStyle(
                text: 'Sign Up',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessPage(),
                    ),
                  );
                },
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
