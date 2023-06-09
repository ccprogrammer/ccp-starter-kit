import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:ccp_starter/example/ui/screen/main_screen/components/example_bottom_nav.dart';
import 'package:ccp_starter/example/ui/screen/main_screen/controllers/example_main_controller.dart';
import 'package:ccp_starter/example/ui/screen/main_screen/screen/example_main1/example_main1_screen.dart';
import 'package:ccp_starter/example/ui/screen/main_screen/screen/example_main2/example_main2_screen.dart';
import 'package:ccp_starter/example/ui/screen/main_screen/screen/example_main3/example_main3_screen.dart';
import 'package:ccp_starter/example/ui/screen/main_screen/screen/example_main4/example_main4_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExampleMainScreen extends GetView<ExampleMainController> {
  const ExampleMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: buildBottomNav(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Obx(() {
      switch (controller.currentPageIndex.value) {
        case 0:
          return const ExampleMain1Screen();

        case 1:
          return const ExampleMain2Screen();

        case 2:
          return const ExampleMain3Screen();

        case 3:
          return const ExampleMain4Screen();

        default:
          return Center(
            child: Text(
              'Example Main Not Found',
              style: TextStyle(
                color: colorWhite,
                fontSize: 14.sp,
              ),
            ),
          );
      }
    });
  }

  Widget buildBottomNav() => Obx(
        () => ExampleBottomNav(
          controller.currentPageIndex.value,
          (index) => controller.changePage(index),
        ),
      );
}
