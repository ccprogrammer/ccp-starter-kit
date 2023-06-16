import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExampleDrawerSettingItem extends StatelessWidget {
  const ExampleDrawerSettingItem({super.key, this.item, required this.onTap});
  final dynamic item;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 24.h),
          child: Row(
            children: [
              Image.asset(
                item['icon_url'],
                width: 24.w,
                color: colorWhite,
              ),
              SizedBox(width: 16.sp),
              Text(
                item['label'] ?? '-',
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 14.sp,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.chevron_right,
                color: colorGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
