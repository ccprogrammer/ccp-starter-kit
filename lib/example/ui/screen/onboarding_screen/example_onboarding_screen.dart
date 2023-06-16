import 'package:ccp_starter/example/ui/screen/onboarding_screen/controllers/example_onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExampleOnboardingScreen extends GetView<ExampleOnboardingController> {
  const ExampleOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff1D1D1D),
      body: Center(
        child: Text(
          'Onboarding Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
