import 'package:get/get.dart';

class ExampleMainController extends GetxController {
  // Bottom navigation
  var currentPageIndex = 0.obs;
  changePage(index) {
    currentPageIndex.value = index;
  }
}
