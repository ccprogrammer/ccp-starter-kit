import 'dart:developer';

import 'package:ccp_starter/routes/routes.dart';
import 'package:ccp_starter/values/storage_key.dart';
import 'package:get/get.dart';

import '../helper/shared_preferences.dart';

class Services {
  Future initApp() async {
    bool keyAvailable = await checkInstanceKey(StorageKey.exampleIsFirstOpen);
    bool isFirstOpen = false;
    if (keyAvailable) {
      isFirstOpen = await getInstanceBool(StorageKey.exampleIsFirstOpen);
    }
    if (isFirstOpen) {
      log('isFirstOpen');
      Get.offAllNamed(AppRoutes.main);
    } else {
      log('isNotFirstOpen');
      Get.offAllNamed(AppRoutes.onBoarding);
      firstOpenApp();
    }
  }

  loginFlag() async => await setInstanceBool(StorageKey.isLoggedIn, true);

  firstOpenApp() async => await setInstanceBool(StorageKey.isFirstOpen, true);

  clearStorage() async {
    log('Storage Cleared');
    await clearInstance();
  }
}
