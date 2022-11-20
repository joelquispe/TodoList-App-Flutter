import 'package:apptask/app/controllers/initialize_controller.dart';
import 'package:apptask/app/data/models/user.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class UsersController extends GetxController {
  final putInit = Get.put(InitializeController());
  final controllerName = TextEditingController().obs;
  final controllerLastName = TextEditingController().obs;
  final controllerPhone = TextEditingController().obs;
  final controllerEmail = TextEditingController().obs;

  void createUser() {
    UserModel userModel = new UserModel();
    userModel.id = Uuid().v4();
    userModel.name = controllerName.value.text;
    userModel.lastname = controllerLastName.value.text;
    
    putInit.listUsers.value.add(userModel);
    putInit.itemCountUser.value = putInit.listUsers.value.length;
  }
}
