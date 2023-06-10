import 'package:ccp_starter/example/values/example_insets.dart';
import 'package:ccp_starter/example/ui/components/section/example_custom_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExampleCustomRow extends StatelessWidget {
  const ExampleCustomRow({
    super.key,
    required this.data,
    required this.title,
    required this.item,
    this.actionTap,
  });
  final List data;
  final Function? actionTap;
  final String title;
  final Function(int index, Map<String, dynamic> item) item;

  @override
  Widget build(BuildContext context) {
    return ExampleCustomSection(
      title: title,
      actionTap: () => actionTap != null ? actionTap!() : null,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: margin16.w,
          right: margin16.w,
          top: 0,
        ),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            data.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                  left: index == 0 ? 0 : margin16.w),
              child: item(
                index,
                data[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
