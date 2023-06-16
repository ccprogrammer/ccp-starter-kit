import 'package:ccp_starter/ui/screen/init_screen/controllers/init_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitController>(
      () => InitController(),
    );
  }
}
