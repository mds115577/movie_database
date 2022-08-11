import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(221, 154, 144, 101),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(221, 154, 144, 101),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Create Account',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _signUpController.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: (TextFormField(
                        controller:
                            _signUpController.firstNameEditingController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.abc,
                            ),
                            hintText: 'Enter Your Name',
                            fillColor: Color.fromARGB(255, 0, 0, 0),
                            focusColor: Color.fromARGB(255, 0, 0, 0)),
                        validator: (value) {
                          if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value!) ||
                              value.length < 3) {
                            return 'please enter valid Name';
                          } else {
                            return null;
                          }
                        },
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: (TextFormField(
                        controller: _signUpController.ageediting,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.numbers,
                            ),
                            hintText: 'age',
                            fillColor: Color.fromARGB(255, 0, 0, 0),
                            focusColor: Color.fromARGB(255, 0, 0, 0)),
                        validator: (value) {
                          if (RegExp(r'^[0-9][)]*$').hasMatch(value!) ||
                              value.length > 3 ||
                              value.isEmpty) {
                            return 'please enter valid Age';
                          } else {
                            return null;
                          }
                        },
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: (TextFormField(
                        controller: _signUpController.numberController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.phone,
                            ),
                            hintText: 'Mobile Number',
                            fillColor: Colors.grey,
                            focusColor: Colors.grey),
                        validator: (value) {
                          if (!RegExp(r'^[0-9]{10}$').hasMatch(value!) ||
                              value.length > 10) {
                            return 'please enter valid number';
                          } else {
                            return null;
                          }
                        },
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: (TextFormField(
                        controller: _signUpController.emailEditingController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                            ),
                            hintText: 'Enter your  e-mail',
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            focusColor: Colors.grey),
                        validator: (value) {
                          if (!RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')
                                  .hasMatch(value!) ||
                              value.length < 3) {
                            return 'please enter valid email';
                          } else {
                            return null;
                          }
                        },
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: (TextFormField(
                        controller: _signUpController.passwordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.password,
                            ),
                            hintText: 'Password',
                            fillColor: Colors.grey,
                            focusColor: Colors.grey),
                      )),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 78, 152, 22),
                      ),
                    ),
                    onPressed: () async {
                      await _signUpController.signUp(
                          _signUpController.emailEditingController.text,
                          _signUpController.passwordController.text);
                    },
                    child: const Text('Sign-up'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
