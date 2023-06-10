import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:ccp_starter/example/ui/components/example_drawer/component/example_custom_drawer_header.dart';
import 'package:ccp_starter/example/ui/components/example_drawer/component/my_drawer_settings.dart';
import 'package:ccp_starter/example/ui/components/example_drawer/controllers/example_custom_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExampleCustomDrawer extends GetView<ExampleCustomDrawerController> {
  const ExampleCustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildHeader() => const ExampleCustomDrawerHeader();
    Widget buildSettings() => const ExampleCustomDrawerSettings();
    return Drawer(
      width: Get.width * 0.9,
      backgroundColor: colorBrown,
      child: Column(
        children: [
          buildHeader(),
          buildSettings(),
        ],
      ),
    );
  }
}
