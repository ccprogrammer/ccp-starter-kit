import 'package:ccp_starter/example/ui/screen/init_screen/controllers/example_init_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExampleInitScreen extends GetView<ExampleInitController> {
  const ExampleInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ExampleInitController>();

    return const Scaffold(
      backgroundColor: Color(0xff1D1D1D),
      body: Center(
        child: Text(
          'Example Init Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
