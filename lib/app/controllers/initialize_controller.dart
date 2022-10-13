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
    Get.defaultDialog(
        title: "Eliminación de tarea",
        content: Text("La tarea sera eliminada permanentemente",textAlign: TextAlign.center,),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              onPressed: () {
                listTask.value.remove(task);
    itemCount.value--;
                Get.back();
              },
              child: Text("Eliminar")),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              onPressed: () {
                
                Get.back();
              },
              child: Text("Cancelar"))
        ]);
    
  }

  void deleteUser(UserModel user) {
    

    Get.defaultDialog(
        title: "Eliminación de usuario",
        content: Text("El usuario sera eliminado permanentemente",textAlign: TextAlign.center,),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              onPressed: () {
               listUsers.value.remove(user);
    itemCountUser.value--;
                Get.back();
              },
              child: Text("Eliminar")),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              onPressed: () {
                
                Get.back();
              },
              child: Text("Cancelar"))
        ]);
  }
}
