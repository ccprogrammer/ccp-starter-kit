import 'package:ccp_starter/example/FOLDER_TEMPLATE/controllers/example_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExampleScreen extends GetView<ExampleController> {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void exampleFunction() {
      controller.getData();
    }

    return const Scaffold(
      backgroundColor: Color(0xff1D1D1D),
      body: Center(
        child: Text(
          'Screen Template',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
