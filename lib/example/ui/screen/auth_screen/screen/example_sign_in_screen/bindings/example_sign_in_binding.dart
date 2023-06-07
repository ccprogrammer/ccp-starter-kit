import 'package:ccp_starter/example/ui/screen/auth_screen/screen/example_sign_in_screen/controllers/example_sign_in_controller.dart';
import 'package:get/get.dart';

class ExampleSignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleSignInController>(
      () => ExampleSignInController(),
    );
  }
}
