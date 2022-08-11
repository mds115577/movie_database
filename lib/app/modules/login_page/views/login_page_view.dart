import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../sign_up/views/sign_up_view.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final LoginPageController _loginPageController =
      Get.put(LoginPageController());
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 154, 144, 101),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: SizedBox(
                width: 300,
                height: 300,
                child: Center(
                  child: Lottie.asset('assets/lottie/81986-movie.json'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 64,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Row(
                            children: [
                              Icon(Icons.email),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _emailcontroller,
                                  decoration: InputDecoration(
                                    focusColor: Colors.white,
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: ' E-mail',
                                    hintStyle: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 75, 71, 71),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (!RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')
                                            .hasMatch(value!) ||
                                        value.length < 3) {
                                      return 'please enter valid email';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 64,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Row(
                            children: [
                              Icon(Icons.lock),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _passwordcontroller,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    focusColor: Colors.white,
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: ' Password',
                                    hintStyle: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 75, 71, 71),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.off(SignUpView());
                            },
                            child: const Text(
                              'Dont have an account?',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 78, 152, 22),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          _loginPageController.loginFunct(
                              email: _emailcontroller.text,
                              password: _passwordcontroller.text);
                        },
                        child: Text('Login'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'OR',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SignInButton(Buttons.Google, onPressed: () {
                      _loginPageController.signInWithGoogle(context);
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
