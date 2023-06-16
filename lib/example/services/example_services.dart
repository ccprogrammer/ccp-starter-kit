import 'dart:developer';

import 'package:ccp_starter/example/helper/example_shared_preferences.dart';
import 'package:ccp_starter/example/routes/example_routes.dart';
import 'package:ccp_starter/example/ui/screen/auth_screen/controllers/example_auth_controller.dart';
import 'package:ccp_starter/example/values/example_storage_key.dart';
import 'package:get/get.dart';

class ExampleServices {
  Future initApp() async {
    bool keyAvailable =
        await checkInstanceKey(ExampleStorageKey.exampleIsFirstOpen);
    bool isFirstOpen = false;
    if (keyAvailable) {
      isFirstOpen = await getInstanceBool(ExampleStorageKey.exampleIsFirstOpen);
    }

    if (isFirstOpen) {
      log('exampleIsFirstOpen');
      Get.offAllNamed(ExampleAppRoutes.exampleMain);
    } else {
      log('exampleIsNotFirstOpen');
      Get.offAllNamed(ExampleAppRoutes.exampleOnBoarding);
      firstOpenApp();
    }

    Get.put(ExampleAuthController());
  }

  firstOpenApp() async =>
      await setInstanceBool(ExampleStorageKey.exampleIsFirstOpen, true);

  clearStorage() async {
    log('Storage Cleared');
    await clearInstance();
  }
}
