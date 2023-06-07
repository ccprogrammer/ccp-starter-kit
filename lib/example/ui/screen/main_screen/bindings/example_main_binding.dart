import 'package:ccp_starter/example/ui/screen/main_screen/controllers/example_main_controller.dart';
import 'package:get/get.dart';

class ExampleMainBinding extends Bindings {
  @override
  void dependencies() {
    // akan terinisialisasi pada saat di Get.find atau controler di gunakan dan akan di dispose otomatis saat route / screen di hapus
    Get.lazyPut<ExampleMainController>(
      () => ExampleMainController(),
    );
  }
}
