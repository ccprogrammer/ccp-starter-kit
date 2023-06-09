import 'package:ccp_starter/example/data/dummy_data.dart';
import 'package:ccp_starter/example/themes/example_insets.dart';
import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:ccp_starter/example/ui/components/example_app_bar/example_custom_app_bar.dart';
import 'package:ccp_starter/example/ui/components/example_app_bar/example_custom_fade_app_bar.dart';
import 'package:ccp_starter/example/ui/components/example_carousel/example_carousel.dart';
import 'package:ccp_starter/example/ui/components/example_image/custom_image_builder.dart';
import 'package:ccp_starter/example/ui/components/example_section/example_custom_column.dart';
import 'package:ccp_starter/example/ui/components/example_section/example_custom_row.dart';
import 'package:ccp_starter/example/ui/components/example_section/example_custom_section.dart';
import 'package:ccp_starter/example/ui/components/example_wrapper/example_card_wrapper.dart';
import 'package:ccp_starter/example/ui/screen/main_screen/screen/example_main1/controllers/example_main1_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExampleMain1Screen extends GetView<ExampleMain1Controller> {
  const ExampleMain1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBrown,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return ExampleCustomFadeAppBar(
      color: colorLightBrown,
      title: 'Custom Fade AppBar',
      child: (scrollController) => ListView(
        controller: scrollController,
        padding: EdgeInsets.only(bottom: marginBottomView.h),
        children: [
          buildBanner(),
          buildCarousel(),
          buildSection(),
          buildRow(),
          buildColumn(),
        ],
      ),
    );
  }

  Widget buildBanner() => Container(
        width: double.infinity,
        height: 250.h,
        decoration: const BoxDecoration(
          color: colorLightBrown,
        ),
        child: ExampleCustomImageBuilder(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiRhyDX-0U5Znby3iJEeNWKR2Rjv5475ESAA&usqp=CAU',
          child: (imageProvider) => Image(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget buildCarousel() => PemiluCarousel(
        data: DummyData.chart,
      );

  PreferredSizeWidget buildAppBar() => const CustomAppBar(
        title: 'Custom App Bar',
        color: colorLightBrown,
      );

  Widget buildSection() => ExampleCustomSection(
        title: 'Example Custom Section',
        child: ExampleCardWrapper(
          margin: EdgeInsets.symmetric(horizontal: margin16.w),
          child: SizedBox(
            width: double.infinity,
            height: 100.h,
            child: const Center(
              child: Text(
                'Placeholder',
                style: TextStyle(color: colorWhite),
              ),
            ),
          ),
        ),
        actionTap: () => null,
      );

  Widget buildRow() => ExampleCustomRow(
        title: 'Example Custom Row',
        data: const [
          {'index': 1},
          {'index': 2},
          {'index': 3},
          {'index': 4},
          {'index': 5},
          {'index': 6},
        ],
        actionTap: () => null,
        item: (index, item) => ExampleCardWrapper(
          child: Text(
            'Placeholder ${item['index']}',
            style: const TextStyle(color: colorWhite),
          ),
        ),
      );

  Widget buildColumn() => ExampleCustomColumn(
        title: 'Example Custom Column',
        data: const [
          {'index': 1},
          {'index': 2},
          {'index': 3},
          {'index': 4},
          {'index': 5},
          {'index': 6},
        ],
        actionTap: () => null,
        item: (index, item) => ExampleCardWrapper(
          child: Text(
            'Placeholder ${item['index']}',
            style: const TextStyle(color: colorWhite),
          ),
        ),
      );
}
