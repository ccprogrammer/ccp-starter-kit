
import 'package:ccp_starter/example/services/example_services.dart';
import 'package:get/get.dart';

class ExampleInitController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await ExampleServices().initApp();
  }
}
