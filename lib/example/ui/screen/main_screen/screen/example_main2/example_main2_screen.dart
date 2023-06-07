import 'package:ccp_starter/example/FOLDER_TEMPLATE/controllers/example_controller.dart';
import 'package:ccp_starter/example/themes/example_my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExampleMain2Screen extends GetView<ExampleController> {
  const ExampleMain2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ExampleMyColor.colorBrown,
      body: Center(
        child: Text(
          'Example Main 2',
          style: TextStyle(
            color: ExampleMyColor.colorWhite,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
