import 'dart:io';

import 'package:get/get.dart';

class ErrorScreenController extends GetxController {
  //TODO: Implement ErrorScreenController

  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
  bool connected = true;
  Future<void> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('Google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connected = true;
        // print('connected');
      }
    } on SocketException catch (_) {
      connected = false;
      // print('not connected');
    }
    update;
  }
}
