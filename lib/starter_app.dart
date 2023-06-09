import 'package:ccp_starter/example/routes/example_routes.dart';
import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:ccp_starter/example/ui/components/button/example_button.dart';
import 'package:ccp_starter/routes/routes.dart';
import 'package:ccp_starter/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StarterApp extends StatelessWidget {
  const StarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBrown,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExampleButton(
                label: 'App',
                onTap: () {
                  Get.toNamed(AppRoutes.init);
                },
              ),
              ExampleButton(
                label: 'Example',
                marginTop: 16.h,
                onTap: () {
                  Get.toNamed(ExampleAppRoutes.exampleInit);
                },
              ),
              ExampleButton(
                label: 'Clear Storage',
                marginTop: 42.h,
                onTap: () {
                  Services().clearStorage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
