import 'package:ccp_starter/example/data/dummy_data.dart';
import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:ccp_starter/example/ui/components/example_chart/example_chart.dart';
import 'package:ccp_starter/example/ui/components/example_chart/example_pie_chart.dart';
import 'package:ccp_starter/example/ui/screen/main_screen/screen/example_main2/controllers/example_main2_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExampleMain2Screen extends GetView<ExampleMain2Controller> {
  const ExampleMain2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBrown,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return ListView(
      // padding: EdgeInsets.zero,
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
