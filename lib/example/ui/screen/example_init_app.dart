import 'package:ccp_starter/example/services/example_init_services.dart';
import 'package:flutter/material.dart';

class ExampleInitApp extends StatefulWidget {
  const ExampleInitApp({super.key});

  @override
  State<ExampleInitApp> createState() => _ExampleInitAppState();
}

class _ExampleInitAppState extends State<ExampleInitApp> {
  @override
  void initState() {
    super.initState();
    ExampleInitServices.initApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff1D1D1D),
      body: Center(
        child: Text(
          'EXAMPLE INIT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
