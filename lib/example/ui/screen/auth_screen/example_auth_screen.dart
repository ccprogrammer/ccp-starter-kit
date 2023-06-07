// ignore_for_file: unused_element

import 'package:ccp_starter/example/routes/example_routes.dart';
import 'package:ccp_starter/example/ui/screen/auth_screen/controllers/example_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExampleAuthScreen extends GetView<ExampleAuthController> {
  const ExampleAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D1D1D),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(ExampleAppRoutes.exampleSignIn);
                },
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Get.toNamed(ExampleAppRoutes.exampleSignUp);
                },
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
