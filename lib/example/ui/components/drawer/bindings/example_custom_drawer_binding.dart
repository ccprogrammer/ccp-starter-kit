import 'package:ccp_starter/example/ui/components/drawer/controllers/example_custom_drawer_controller.dart';
import 'package:get/get.dart';

class ExampleCustomDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleCustomDrawerController>(
      () => ExampleCustomDrawerController(),
    );
  }
}
