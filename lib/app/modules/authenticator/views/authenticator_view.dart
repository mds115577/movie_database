import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_database/app/modules/error_screen/views/error_screen_view.dart';
import 'package:movie_database/app/modules/home_screen/views/home_screen_view.dart';
import 'package:movie_database/app/modules/login_page/views/login_page_view.dart';

import '../controllers/authenticator_controller.dart';

class AuthenticatorView extends GetView<AuthenticatorController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Container();
          } else if (snapshot.hasData) {
            return HomeScreenView();
          } else if (snapshot.connectionState == ConnectionState.none) {
            return ErrorScreenView();
          } else {
            return LoginPageView();
          }
        });
  }
}
