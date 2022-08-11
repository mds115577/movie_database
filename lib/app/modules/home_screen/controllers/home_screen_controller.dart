import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_database/app/modules/home_screen/views/home_screen_view.dart';

import '../../api.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  List<Welcome> fetchedList = [];

  Future<List<Welcome>> fetchData() async {
    final response = await http.get(Uri.parse(
        'http://api.themoviedb.org/3/movie/popular?api_key=3f28f3393a61eee30e840d3aa265c0f9&page=1'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      Iterable maps = result["results"];
      fetchedList = maps.map((movie) => Welcome.fromJson(movie)).toList();
      // log(fetchedList[0].id.toString());
      // log(fetchedList[0].toString());
      return fetchedList;
    } else {
      throw Exception("Failed to load movie");
    }
  }

  logout() async {
    Get.defaultDialog(
        title: 'Alert',
        middleText: 'Do You Want SignOut',
        titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textConfirm: 'Yes',
        textCancel: 'No',
        onConfirm: () async {
          FirebaseAuth auth = FirebaseAuth.instance;
          await auth.signOut();
          await GoogleSignIn().signOut();

          Get.back();
          // await Get.offAll(HomeView());
        },
        onCancel: () {
          Get.off(HomeScreenView());
        },
        buttonColor: Color.fromARGB(255, 0, 0, 0),
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.black);
  }
}
