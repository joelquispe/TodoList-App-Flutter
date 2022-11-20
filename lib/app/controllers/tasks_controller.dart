import 'package:apptask/app/controllers/initialize_controller.dart';
import 'package:apptask/app/data/models/task.model.dart';
import 'package:apptask/app/data/models/user.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class TasksController extends GetxController {
  late GlobalKey<FormState> formkey;
  final putInit = Get.put(InitializeController());
  RxList<UserModel> users = RxList<UserModel>();
  final controllerTitle = TextEditingController().obs;
  final controllerDescription = TextEditingController().obs;

  var selectPriority = Rxn<String>();
  var selectUser = Rxn<UserModel>();
 

  void createTask() {
    Task task = new Task();
    UserModel userModel = new UserModel();
    task.id = Uuid().v4();
    task.title = controllerTitle.value.text;
    task.descripcion = controllerDescription.value.text;
    task.priority = selectPriority.value;
    task.userModel = selectUser.value;

    putInit.listTask.value.add(task);
    putInit.itemCount.value = putInit.listTask.value.length;
    print(putInit.listTask.value);
    controllerTitle.value.clear();
    controllerDescription.value.clear();
    selectPriority.value = null;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("====================");
    formkey = GlobalKey<FormState>();
    print(putInit.listUsers.value);
    if (putInit.itemCountUser.value > 0) {
      users.value = putInit.listUsers.value;
    }
  }
}
