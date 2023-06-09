import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExampleDrawerSettingSwitch extends StatefulWidget {
  const ExampleDrawerSettingSwitch({super.key, this.item});
  final dynamic item;

  @override
  State<ExampleDrawerSettingSwitch> createState() => _ExampleDrawerSettingSwitchState();
}

class _ExampleDrawerSettingSwitchState extends State<ExampleDrawerSettingSwitch> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 24.h),
      child: Row(
        children: [
          Image.asset(
            widget.item['icon_url'],
            width: 24,
          ),
          SizedBox(width: 16.w),
          Text(
            widget.item['label'],
            style: TextStyle(
              color: colorWhite,
              fontSize: 14.sp,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 32.h,
            child: FittedBox(
              child: CupertinoSwitch(
                value: switchValue,
                activeColor: colorBlue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
