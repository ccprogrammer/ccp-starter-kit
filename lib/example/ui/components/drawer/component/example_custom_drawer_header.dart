import 'package:ccp_starter/example/values/example_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExampleCustomDrawerHeader extends StatelessWidget {
  const ExampleCustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180.h,
      decoration: BoxDecoration(
        color: colorBlue,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(60.r),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
