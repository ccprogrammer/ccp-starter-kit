import 'package:ccp_starter/ui/screen/init_screen/controllers/init_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitScreen extends GetView<InitController> {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<InitController>();

    return const Scaffold(
      backgroundColor: Color(0xff1D1D1D),
      body: Center(
        child: Text(
          'Init Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
