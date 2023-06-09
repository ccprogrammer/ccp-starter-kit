import 'package:ccp_starter/example/themes/example_insets.dart';
import 'package:ccp_starter/example/themes/example_my_color.dart';
import 'package:ccp_starter/example/themes/example_textstyle.dart';
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
          ExampleMyInsets.margin16.w,
          ExampleMyInsets.margin24.h,
          ExampleMyInsets.margin16.w,
          ExampleMyInsets.margin16.h,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: ExampleMyColor.colorWhite,
                  fontSize: 14.sp,
                  fontWeight: ExampleMyText.medium,
                ),
              ),
            ),
            trailing != null
                ? trailing!
                : GestureDetector(
                    onTap: () => actionTap != null ? actionTap!() : null,
                    child: Icon(
                      Icons.chevron_right,
                      color: ExampleMyColor.colorWhite,
                      size: 20.w,
                    ),
                  ),
          ],
        ),
      );

  Widget buildChild() => child;
}
