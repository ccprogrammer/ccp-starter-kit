import 'package:ccp_starter/example/ui/screen/onboarding_screen/controllers/example_onboarding_controller.dart';
import 'package:get/get.dart';

class ExampleOnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleOnboardingController>(
      () => ExampleOnboardingController(),
    );
  }
}
