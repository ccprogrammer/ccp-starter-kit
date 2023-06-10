import 'package:ccp_starter/example/values/example_insets.dart';
import 'package:ccp_starter/example/values/example_color.dart';
import 'package:ccp_starter/example/values/example_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExampleCustomSection extends StatelessWidget {
  const ExampleCustomSection({
    super.key,
    required this.title,
    required this.child,
    this.actionTap,
    this.trailing,
  });
  final Function? actionTap;
  final String title;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // section title
        buildTitle(),

        // section child
        buildChild(),
      ],
    );
  }

  Widget buildTitle() => Container(
        margin: EdgeInsets.fromLTRB(
          margin16.w,
          margin24.h,
          margin16.w,
          margin16.h,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 14.sp,
                  fontWeight: medium,
                ),
              ),
            ),
            trailing != null
                ? trailing!
                : GestureDetector(
                    onTap: () => actionTap != null ? actionTap!() : null,
                    child: Icon(
                      Icons.chevron_right,
                      color: colorWhite,
                      size: 20.w,
                    ),
                  ),
          ],
        ),
      );

  Widget buildChild() => child;
}
