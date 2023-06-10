import 'package:ccp_starter/example/themes/example_image_url.dart';
import 'package:ccp_starter/example/ui/components/example_drawer/additional_settings/drawer_setting_item.dart';
import 'package:ccp_starter/example/ui/components/example_drawer/controllers/example_custom_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExampleCustomDrawerSettings
    extends GetView<ExampleCustomDrawerController> {
  const ExampleCustomDrawerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    List settingList = [
      {
        'icon_url': iconSettings,
        'label': 'Setting 1',
        'routes': '/',
      },
      {
        'icon_url': iconSettings,
        'label': 'Setting 2',
        'routes': '/',
      },
    ];

    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: settingList.length,
        separatorBuilder: (context, index) => const SizedBox(),
        itemBuilder: (context, index) {
          var item = settingList[index];

          return DrawerSettingItem(
            item: item,
            onTap: () => Get.toNamed(item['routes']),
          );
        },
      ),
    );
  }
}
