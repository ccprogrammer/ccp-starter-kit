import 'package:ccp_starter/example/FOLDER_TEMPLATE/controllers/example_controller.dart';
import 'package:get/get.dart';

class ExampleBinding extends Bindings {
  @override
  void dependencies() {
    // akan terinisialisasi pada saat di Get.find atau controler di gunakan dan akan di dispose otomatis saat route / screen di hapus
    Get.lazyPut<ExampleController>(
      () => ExampleController(),
    );

    // pilih salah satu lazyPut/put

    // akan langsung terinisiaisasi saat halaman di navigasi dan controller akan permanen
    Get.put(
      ExampleController(),
      permanent: true, // sepertinya tanpa di set permanen udah permanen
    );
  }
}
