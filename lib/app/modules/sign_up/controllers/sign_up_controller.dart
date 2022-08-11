import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_database/app/modules/authenticator/views/authenticator_view.dart';

import '../sign_up_model.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  final firstNameEditingController = TextEditingController();
  final ageediting = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordController = TextEditingController();
  final numberController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
  signUp(String email, String password) async {
    if (formKey.currentState!.validate()) {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetails()})
          .catchError((e) {
        Get.snackbar('title', e.toString());
      });
    }
  }

  postDetails() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    DataModel dataModel = DataModel();

    dataModel.uid = user!.uid;
    dataModel.email = user.email;
    dataModel.name = firstNameEditingController.text;
    dataModel.age = ageediting.text;
    dataModel.number = numberController.text;
    dataModel.s = Timestamp.now();
    await firebaseFirestore
        .collection("newdata")
        .doc(user.uid)
        .set(dataModel.toMap());
    print('data uploaded');
    Get.snackbar('Alert', 'Account Succesfully created',
        snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
    update();
    Get.off(AuthenticatorView());
  }
}
