import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

bool isPortrait() {
  return Get.mediaQuery.orientation == Orientation.portrait;
}

void lockPortraitOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

void lockLandscapeOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}

void openOrientationLock() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
