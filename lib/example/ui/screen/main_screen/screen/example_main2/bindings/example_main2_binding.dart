import 'package:ccp_starter/example/ui/screen/main_screen/screen/example_main2/controllers/example_main2_controller.dart';
import 'package:get/get.dart';

class ExampleMain2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleMain2Controller>(
      () => ExampleMain2Controller(),
    );
  }
}
