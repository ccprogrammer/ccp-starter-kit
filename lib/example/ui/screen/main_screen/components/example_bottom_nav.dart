import 'package:ccp_starter/example/themes/example_image_url.dart';
import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExampleBottomNav extends StatelessWidget {
  const ExampleBottomNav(this.currentIndex, this.onTap, {super.key});
  final int currentIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: BottomNavigationBar(
        selectedItemColor: colorWhite,
        unselectedItemColor: Colors.white.withOpacity(0.8),
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        showUnselectedLabels: true,
        backgroundColor: colorLightBrown,
        onTap: (index) => onTap(index),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 0
                  ? ExampleMyImage.iconMain1
                  : ExampleMyImage.iconMain1,
              width: 24.w,
              height: 32.h,
              color:
                  currentIndex == 0 ? colorWhite : colorWhite.withOpacity(0.6),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 1
                  ? ExampleMyImage.iconMain2
                  : ExampleMyImage.iconMain2,
              width: 24.w,
              height: 32.h,
              color:
                  currentIndex == 1 ? colorWhite : colorWhite.withOpacity(0.6),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 2
                  ? ExampleMyImage.iconMain3
                  : ExampleMyImage.iconMain3,
              width: 24.w,
              height: 32.h,
              color:
                  currentIndex == 2 ? colorWhite : colorWhite.withOpacity(0.6),
            ),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 3
                  ? ExampleMyImage.iconMain4
                  : ExampleMyImage.iconMain4,
              width: 24.w,
              height: 32.h,
              color:
                  currentIndex == 3 ? colorWhite : colorWhite.withOpacity(0.6),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
