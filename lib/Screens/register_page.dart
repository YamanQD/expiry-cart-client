// ignore_for_file: file_names

import 'package:expiry_cart/Screens/sign_in_page.dart';
import 'package:expiry_cart/Screens/success_page.dart';
import 'package:expiry_cart/Style/app_icon.dart';
import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/Style/register.dart';
import 'package:expiry_cart/Style/register_style.dart';
import 'package:expiry_cart/Style/text_button_style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String getError(dynamic errors, String name) {
  return errors[name] != null
      ? errors[name].toString().replaceAll(RegExp(r"\[|\]"), '')
      : '';
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final apiUri = 'http://yaman.muhajreen.net:8000/api/';
  bool passwordVisibility = true;
  bool confirmationVisibility = true;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  String usernameError, emailError, passwordError, confirmError;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  void handleRegister(
    String username,
    String email,
    String password,
    String confirmPassword,
    BuildContext context,
  ) async {
    final response = await http.post(
      Uri.parse(apiUri + 'register'),
      body: jsonEncode({
        'name': username,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
      }),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SuccessPage(),
        ),
      );
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var errors = responseData['errors'];
      setState(() {
        usernameError = getError(errors, 'name');
        emailError = getError(errors, 'email');
        passwordError = getError(errors, 'password');
        confirmError = getError(errors, 'password_confirmation');
      });
    }
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
                height: 60,
              ),
              UserNameStyle(
                controller: usernameController,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 84, top: 2),
                child: Text(
                  usernameError ?? '',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              EmailStyle(
                controller: emailController,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 84, top: 2),
                child: Text(
                  emailError ?? '',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RegisterField(
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    icon: const Padding(
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
              Padding(
                padding: const EdgeInsets.only(left: 84, top: 2),
                child: Text(
                  passwordError ?? '',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RegisterField(
                child: TextField(
                  controller: confirmController,
                  decoration: InputDecoration(
                    hintText: "Re-Enter Password",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    icon: const Padding(
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
              Padding(
                padding: const EdgeInsets.only(left: 84, top: 2),
                child: Text(
                  confirmError ?? '',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButtonStyle(
                text: 'Sign Up',
                press: () {
                  handleRegister(
                    usernameController.text,
                    emailController.text,
                    passwordController.text,
                    confirmController.text,
                    context,
                  );
                },
                // press: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const SuccessPage(),
                //     ),
                //   );
                // },
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
                accountext: 'Already have an Account?',
                text: 'Sign In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
