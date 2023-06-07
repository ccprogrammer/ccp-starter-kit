import 'package:ccp_starter/example/ui/screen/main_screen/screen/example_main1/controllers/example_main1_controller.dart';
import 'package:get/get.dart';

class ExampleMain1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleMain1Controller>(
      () => ExampleMain1Controller(),
    );
  }
}
