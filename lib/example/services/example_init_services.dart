import 'package:ccp_starter/example/routes/example_routes.dart';
import 'package:ccp_starter/example/ui/screen/auth_screen/controllers/example_auth_controller.dart';
import 'package:get/get.dart';

class ExampleInitServices {
  static bool isLoggedIn = true;

  static initApp() {
    Get.put(ExampleAuthController());
    loginState();
  }

  static loginState() {
    Future.delayed(
      const Duration(milliseconds: 1200),
      () {
        if (isLoggedIn) {
          Get.toNamed(ExampleAppRoutes.exampleMain);
        } else {
          Get.toNamed(ExampleAppRoutes.exampleAuth);
        }
      },
    );
  }
}
