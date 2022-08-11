import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/error_screen_controller.dart';

class ErrorScreenView extends GetView<ErrorScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error!'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'No internet',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
