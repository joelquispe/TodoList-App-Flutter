
import 'package:get/get.dart';
import '../controllers/initialize_controller.dart';


class InitializeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitializeController>(() => InitializeController());
  }
}