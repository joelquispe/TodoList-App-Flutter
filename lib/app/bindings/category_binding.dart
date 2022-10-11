
import 'package:get/get.dart';
import '../controllers/category_controller.dart';


class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}