
import 'package:get/get.dart';
import '../controllers/users_controller.dart';


class UsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersController>(() => UsersController());
  }
}