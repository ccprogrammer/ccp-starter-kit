import 'package:ccp_starter/example/ui/screen/init_screen/controllers/example_init_controller.dart';
import 'package:get/get.dart';

class ExampleInitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleInitController>(
      () => ExampleInitController(),
    );
  }
}
