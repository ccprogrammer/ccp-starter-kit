import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExampleCardWrapper extends StatelessWidget {
  const ExampleCardWrapper({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.all(12.w),
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? colorLightBrown,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: child,
    );
  }
}
