import 'package:ccp_starter/example/values/example_color.dart';
import 'package:flutter/material.dart';

class ExampleCustomLoading extends StatelessWidget {
  const ExampleCustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: colorWhite,
        strokeWidth: 3,
      ),
    );
  }
}
