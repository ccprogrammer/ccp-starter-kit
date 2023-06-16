import 'dart:developer';

import 'package:ccp_starter/helper/shared_preferences.dart';
import 'package:ccp_starter/values/storage_key.dart';

class Services {
  Future initApp() async {
    bool keyAvailable = await checkInstanceKey(StorageKey.isFirstOpen);
    bool isFirstOpen = false;
    if (keyAvailable) {
      isFirstOpen = await getInstanceBool(StorageKey.isFirstOpen);
    }
    if (isFirstOpen) {
      log('isFirstOpen');
    } else {
      log('isNotFirstOpen');
      firstOpenApp();
    }
  }

  firstOpenApp() async => await setInstanceBool(StorageKey.isFirstOpen, true);

  clearStorage() async {
    log('Storage Cleared');
    await clearInstance();
  }
}
