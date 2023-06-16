
import 'package:ccp_starter/services/services.dart';
import 'package:get/get.dart';

class InitController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await Services().initApp();
  }
}
