import 'package:ccp_starter/example/ui/components/example_drawer/controllers/example_custom_drawer_controller.dart';
import 'package:get/get.dart';

class ExampleMain1Controller extends GetxController {
  get openDrawer => Get.find<ExampleCustomDrawerController>().openDrawer();
}
