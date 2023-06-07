import 'package:ccp_starter/example/ui/screen/auth_screen/screen/example_sign_up_screen/controllers/example_sign_un_controller.dart';
import 'package:get/get.dart';

class ExampleSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleSignUpController>(
      () => ExampleSignUpController(),
    );
  }
}
