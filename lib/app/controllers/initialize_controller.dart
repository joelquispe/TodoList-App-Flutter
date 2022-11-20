import 'package:apptask/app/data/models/task.model.dart';
import 'package:apptask/app/data/models/user.model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class InitializeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxInt itemCount = 0.obs;
  RxInt itemCountUser = 0.obs;
  RxList<Task> listTask = RxList<Task>();
  RxList<UserModel> listUsers = RxList<UserModel>();
  final controllerName = TextEditingController().obs;
  final controllerLastname = TextEditingController().obs;
  final controllerTitle = TextEditingController().obs;
  final controllerDescription = TextEditingController().obs;
  var selectPriority = Rxn<String>();
  var selectUser = Rxn<UserModel>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void dataEdit(i) {
    Task task = listTask.value[i];
    controllerTitle.value.text = task.title!;
    controllerDescription.value.text = task.descripcion!;
    selectPriority.value = task.priority;
    selectUser.value = task.userModel;
  }

  void deleteTask(Task task) {
    Get.defaultDialog(
        title: "Eliminación de tarea",
        content: Text(
          "La tarea sera eliminada permanentemente",
          textAlign: TextAlign.center,
        ),
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
        content: Text(
          "El usuario sera eliminado permanentemente",
          textAlign: TextAlign.center,
        ),
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

  void editUser(i) {
    UserModel user = new UserModel();
    user.lastname = controllerLastname.value.text;
    user.name = controllerName.value.text;

    print(i);
    var index = listUsers.value.indexOf(listUsers.value[i]);
    listUsers.value[index] = user;
    print(listUsers.value);

    Fluttertoast.showToast(
        msg: "Usuario editado", backgroundColor: Colors.deepPurple);

    Get.back();
    this.listUsers.refresh();
    update();
  }

  void editTask(i) {
    Task task = new Task();
    task.title = controllerTitle.value.text;
    task.descripcion = controllerDescription.value.text;
    task.priority = selectPriority.value;
    task.userModel = selectUser.value;
    listTask.value[i] = task;
    print(task.userModel);
    update();
    Get.back();
  }
}
