
import 'package:get/get.dart';
import '../controllers/tasks_controller.dart';


class TasksBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TasksController>(() => TasksController());
  }
}