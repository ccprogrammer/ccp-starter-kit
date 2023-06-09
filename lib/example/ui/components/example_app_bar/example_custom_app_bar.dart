import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:ccp_starter/example/themes/example_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.bottom,
      required this.title,
      this.actionButton,
      this.statusBarColor,
      this.isBold = true,
      this.centerTitle = true,
      this.color = Colors.transparent,
      this.showLeading = true,
      this.radiusLeft = 0.0,
      this.radiusRight = 0.0});
  final dynamic title;
  final List<Widget>? actionButton;
  final bool isBold;
  final bool centerTitle;
  final Color color;
  final Color? statusBarColor;
  final bool showLeading;
  final double radiusLeft;
  final double radiusRight;
  final dynamic bottom;

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? 55.h : 110.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: color,
      elevation: 0,
      centerTitle: centerTitle,
      titleSpacing: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(radiusRight.r),
        ),
      ),
      leading: showLeading
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.chevron_left,
              ),
            )
          : null,
      title: Container(
        child: title is String
            ? Text(
                title,
                style: TextStyle(
                  color: colorWhite,
                  fontWeight: isBold ? bold : null,
                  fontSize: 16.sp,
                ),
              )
            : title,
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(radiusRight.r),
          ),
        ),
      ),
      actions: actionButton,
    );
  }
}
