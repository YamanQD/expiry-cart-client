// ignore_for_file: file_names

import 'package:expiry_cart/services/auth.dart';
import 'package:expiry_cart/Screens/success_page.dart';
import 'package:expiry_cart/Screens/register_page.dart';
import 'package:expiry_cart/Style/app_icon.dart';
import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/Style/input_field.dart';
import 'package:expiry_cart/Style/password_field.dart';
import 'package:expiry_cart/Style/register.dart';
import 'package:expiry_cart/Style/text_button_style.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              Container(
                margin: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: kGreenLightColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Your Email',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    icon: Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Icon(
                        Icons.person,
                        color: kGreenColor,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Passwordfield(
                controller: passwordController,
              ),
              const SizedBox(
                height: 50,
              ),
              TextButtonStyle(
                text: 'LOGIN',
                press: () async {
                  final isSuccess = await Auth.login(creds: {
                    'email': emailController.text,
                    'password': passwordController.text,
                  });
                  print(isSuccess);
                  if (isSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessPage(),
                      ),
                    );
                  }
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
