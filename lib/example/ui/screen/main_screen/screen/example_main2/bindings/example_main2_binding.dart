import 'package:ccp_starter/example/ui/screen/main_screen/controllers/example_main_controller.dart';
import 'package:get/get.dart';

class ExampleMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleMainController>(
      () => ExampleMainController(),
    );
  }
}
