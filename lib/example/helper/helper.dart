import 'package:ccp_starter/example/themes/example_my_color.dart';
import 'package:ccp_starter/example/themes/example_textstyle.dart';
import 'package:ccp_starter/example/ui/components/example_button/example_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Helper {

  showPopUp({
    String? title,
    String? message,
    Function()? onClose,
  }) {
    return Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        backgroundColor: ExampleMyColor.colorBrown,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null)
                Text(
                  title,
                  style: TextStyle(
                    color: ExampleMyColor.colorWhite,
                    fontSize: 18.sp,
                    fontWeight: ExampleMyText.medium,
                  ),
                  textAlign: TextAlign.center,
                ),
              if (message != null)
                Container(
                  margin: EdgeInsets.only(top: title != null ? 8 : 0),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: ExampleMyColor.colorWhite,
                      fontSize: 16.sp,
                      fontWeight: ExampleMyText.regular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ExampleButton(
                marginTop: 24.h,
                label: 'Tutup',
                onTap: () => onClose != null ? onClose() : Get.back(),
              ),
            ],
          ),
        ),
      ),
    ).then((value) => onClose != null ? onClose() : null);
  }

}
