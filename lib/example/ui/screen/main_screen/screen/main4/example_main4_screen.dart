import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:ccp_starter/example/ui/screen/main_screen/screen/main4/controllers/example_main4_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExampleMain4Screen extends GetView<ExampleMain4Controller> {
  const ExampleMain4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBrown,
      body: Center(
        child: Text(
          'Example Main 4',
          style: TextStyle(
            color: colorWhite,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
