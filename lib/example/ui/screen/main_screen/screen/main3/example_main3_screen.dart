import 'package:ccp_starter/example/FOLDER_TEMPLATE/controllers/example_controller.dart';
import 'package:ccp_starter/example/values/example_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExampleMain3Screen extends GetView<ExampleController> {
  const ExampleMain3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBrown,
      body: Center(
        child: Text(
          'Example Main 3',
          style: TextStyle(
            color: colorWhite,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
