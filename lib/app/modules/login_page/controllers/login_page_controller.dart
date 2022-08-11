import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_database/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:movie_database/app/modules/home_screen/views/home_screen_view.dart';

class LoginPageController extends GetxController {
  //TODO: Implement LoginPageController

  final count = 0.obs;
  bool visibi = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String verficationId = '';
  @override
  void onClose() {}
  void increment() => count.value++;
  QuerySnapshot? userInfo;
  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();

    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    UserCredential result = await firebaseAuth.signInWithCredential(credential);

    User userDetails = result.user!;

    Map<String, dynamic> userInfoMap = {
      "email": userDetails.email,
      "username": userDetails.email!.replaceAll("@gmail.com", ""),
      "name": userDetails.displayName,
      "imgUrl": userDetails.photoURL
    };
    getUserByUsername(userDetails.displayName!).then((value) {
      userInfo = value;
    });

    await HomeScreenController().fetchData();
    Get.off(HomeScreenView());
    await addUserInfoToDb(userDetails.uid, userInfoMap).then((value) {});
  }

  QuerySnapshot? searchData;
  getUserByUsername(String username) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where("name", isEqualTo: username)
        .get()
        .then((value) {
      searchData = value;
      update();
    });
  }

  Future addUserInfoToDb(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set(userInfoMap);
  }

  verifyPhoneNumber(phone) {
    auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            Get.snackbar('title', 'Signed-In Succesfully');
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          Get.snackbar('title', exception.message.toString());
        },
        codeSent: (String verficId, int? resendToken) {
          verficationId = verficId;
          visibi = true;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: phone);
    update();
  }

  Future loginFunct({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }

    // return user;
  }
}
