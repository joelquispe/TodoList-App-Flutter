import 'package:apptask/app/data/models/task.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitializeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxInt itemCount = 0.obs;
  RxList<Task> listTask = RxList<Task>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    update();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void deleteTask(Task task) {
    Get.dialog(Text("Usuario eliminado"));
    listTask.value.remove(task);
  }
}
