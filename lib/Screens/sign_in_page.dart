// ignore_for_file: file_names

import 'package:expiry_cart/Screens/success_page.dart';
import 'package:expiry_cart/Screens/register_page.dart';
import 'package:expiry_cart/Style/app_icon.dart';
import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/Style/input_field.dart';
import 'package:expiry_cart/Style/password_field.dart';
import 'package:expiry_cart/Style/register.dart';
import 'package:expiry_cart/Style/text_button_style.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key}) : super(key: key);

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
                height: 20,
              ),
              const Text(
                'WELCOME',
                style: kWelcome,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const InputField(
                hintText: 'Your Email',
                icon: Icons.person,
              ),
              const SizedBox(
                height: 20,
              ),
              const Passwordfield(),
              const SizedBox(
                height: 50,
              ),
              TextButtonStyle(
                text: 'LOGIN',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                accountext: 'Don\'t have an Account?',
                text: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
