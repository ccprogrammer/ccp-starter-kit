import 'package:ccp_starter/example/data/dummy_data.dart';
import 'package:ccp_starter/example/values/example_color.dart';
import 'package:ccp_starter/example/values/example_insets.dart';
import 'package:ccp_starter/example/ui/components/app_bar/example_custom_app_bar.dart';
import 'package:ccp_starter/example/ui/components/chart/example_chart.dart';
import 'package:ccp_starter/example/ui/components/chart/example_pie_chart.dart';
import 'package:ccp_starter/example/ui/screen/main_screen/screen/main2/controllers/example_main2_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExampleMain2Screen extends GetView<ExampleMain2Controller> {
  const ExampleMain2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBrown,
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  PreferredSizeWidget buildAppBar() => const CustomAppBar(
        title: 'Custom App Bar',
        color: colorLightBrown,
      );

  Widget buildBody() {
    return ListView(
      padding: EdgeInsets.only(bottom: marginBottomView.h),
      children: [
        ExampleChart(
          data: DummyData.chart,
        ),
        ExamplePieChart(
          data: DummyData.chart,
        ),
      ],
    );
  }
}
