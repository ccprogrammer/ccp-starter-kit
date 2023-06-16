import 'package:ccp_starter/example/ui/screen/auth_screen/controllers/example_auth_controller.dart';
import 'package:get/get.dart';

class ExampleAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleAuthController>(
      () => ExampleAuthController(),
    );
  }
}
