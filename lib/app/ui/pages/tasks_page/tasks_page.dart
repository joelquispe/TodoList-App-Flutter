import 'package:apptask/app/data/models/user.model.dart';
import 'package:apptask/app/ui/global_widgets/buttonSubmit.widget.dart';
import 'package:apptask/app/ui/global_widgets/textField.widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/tasks_controller.dart';

class TasksPage extends GetView<TasksController> {
  @override
  Widget build(BuildContext context) {
    final fkey = GlobalKey<FormState>();
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: Get.width / 1.2,
          child: Form(
            key: fkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldWidget(
                  wcontroller: controller.controllerTitle.value,
                  whinttext: "Ingrese un titulo",
                  wlabeltext: "Titulo",
                  validation: (value) {
                    return value!.isEmpty ? "Llenar campo" : null;
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFieldWidget(
                  maxlines: 6,
                    validation: (value) {
                      return value!.isEmpty ? "Llenar campo" : null;
                    },
                    wcontroller: controller.controllerDescription.value,
                    whinttext: "Ingrese una descripción",
                    wlabeltext: "Descripción"),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => DropdownButton2(
                    underline: Container(
                      color: Colors.purple,
                      height: 1,
                    ),
                    isExpanded: true,
                    onChanged: (value) {
                      controller.selectPriority.value = value.toString();
                      print(value);
                    },
                    value: controller.selectPriority.value,
                    itemHeight: 60,
                    iconEnabledColor: Colors.deepPurple,
                    selectedItemHighlightColor: Colors.purple[100],
                    hint: Text(
                      "Seleccionar Prioridad",
                      style: TextStyle(color: Colors.deepPurple.shade900),
                    ),
                    style: TextStyle(color: Colors.deepPurple[600]),
                    items: [
                      DropdownMenuItem(
                        child: Text("Alta"),
                        value: "alta",
                      ),
                      DropdownMenuItem(
                        child: Text("Media"),
                        value: "media",
                      ),
                      DropdownMenuItem(
                        child: Text("Baja"),
                        value: "baja",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(()=> DropdownButton2(
                  isExpanded: true,
                  onChanged: (value) {
                    print(value);
                    controller.selectUser.value = value as UserModel?;
                  },
                  value: controller.selectUser.value,
                  itemHeight: 60,
                  iconEnabledColor: Colors.deepPurple,
                  selectedItemHighlightColor: Colors.purple[100],
                  buttonElevation: 8,
                  dropdownElevation: 9,
                  underline: Container(
                    color: Colors.purple,
                    height: 1,
                  ),
                  hint: Text("Usuario",
                      style: TextStyle(color: Colors.deepPurple.shade900)),
                  style: TextStyle(color: Colors.deepPurple[600]),
                  items: controller.users.value
                      .map((e) => DropdownMenuItem<UserModel>(
                          value: e, child: Text(e.name!)))
                      .toList(),
                ),),
                
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  width: Get.width,
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonSubmitWidget(
                            pressed: () {
                              if (fkey.currentState!.validate()) {
                                controller.createTask();
                                Fluttertoast.showToast(
                                    msg: "Tarea creado correctamente",
                                    backgroundColor: Colors.deepPurple,
                                    textColor: Colors.white);
                                Get.back();
      
                                print("paso");
                              }
                            },
                            texto: "Crear Tarea",
                          ),
                        ],
                      ),
                      Positioned(
                        left: 5,
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.deepPurple,
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )));
  }
}
