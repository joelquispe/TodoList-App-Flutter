import 'package:apptask/app/data/models/task.model.dart';
import 'package:apptask/app/data/models/user.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitializeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxInt itemCount = 0.obs;
  RxInt itemCountUser = 0.obs;
  RxList<Task> listTask = RxList<Task>();
  RxList<UserModel> listUsers = RxList<UserModel>();
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
    Get.dialog(Text("Tarea eliminado"));
    listTask.value.remove(task);
    itemCount.value--;
  }

  void deleteUser(UserModel user) {
    Get.dialog(Text("Usuario eliminado"));
    listUsers.value.remove(user);
    itemCountUser.value--;
  }
}
