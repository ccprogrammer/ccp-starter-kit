import 'package:ccp_starter/example/ui/components/example_drawer/controllers/example_custom_drawer_controller.dart';
import 'package:get/get.dart';

class ExampleMainController extends GetxController {
  final drawerKey = Get.find<ExampleCustomDrawerController>().scaffoldKey;

  // Bottom navigation
  var currentPageIndex = 0.obs;
  changePage(index) {
    currentPageIndex.value = index;
  }
}
