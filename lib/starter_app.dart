import 'package:ccp_starter/example/routes/example_routes.dart';
import 'package:ccp_starter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StarterApp extends StatelessWidget {
  const StarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D1D1D),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'example',
            onPressed: () {
              Get.toNamed(ExampleAppRoutes.exampleInit);
            },
            child: const Text(
              'Example',
              style: TextStyle(fontSize: 11),
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'app',
            onPressed: () {
              Get.toNamed(AppRoutes.init);
            },
            child: const Text(
              'App',
              style: TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Starter App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
