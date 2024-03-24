import 'package:apptask/app/data/models/user.model.dart';
import 'package:apptask/app/routes/app_routes.dart';
import 'package:apptask/app/ui/global_widgets/buttonSubmit.widget.dart';
import 'package:apptask/app/ui/global_widgets/textField.widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/initialize_controller.dart';

class InitializePage extends GetView<InitializeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InitializeController>(builder: ((controller) {
      return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                backgroundColor: Colors.deepPurple[400],
                automaticallyImplyLeading: false,
                title: Text("Mis tareas", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              SliverToBoxAdapter(
                child: TabBar(indicatorColor: Colors.purple, controller: controller.tabController, tabs: [
                  Tab(
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.task,
                        color: Colors.black,
                      ),
                      Text(
                        "Tareas",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  )),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        Text(
                          "Usuarios",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  )
                ]),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  child: TabBarView(controller: controller.tabController, children: [
                    Obx((() => ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.itemCount.value,
                          itemBuilder: ((context, index) {
                            return Card(
                              elevation: 9,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: ListTile(
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.clipboard),
                                    ],
                                  ),
                                  trailing: PopupMenuButton(itemBuilder: ((context) {
                                    return [
                                      PopupMenuItem(value: 1, onTap: () {}, child: Text("Editar")),
                                      PopupMenuItem(
                                        value: 2,
                                        child: Text("Eliminar"),
                                      ),
                                    ];
                                  }), onSelected: (value) {
                                    controller.dataEdit(index);
                                    switch (value) {
                                      case 1:
                                        Get.bottomSheet(
                                          SingleChildScrollView(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                                              height: Get.height / 1.2,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                                              width: Get.width,
                                              child: Column(
                                                children: [
                                                  TextFieldWidget(
                                                    wcontroller: controller.controllerTitle.value,
                                                    whinttext: "Ingrese un titulo",
                                                    wlabeltext: "Titulo",
                                                    validation: (value) {
                                                      return value!.isEmpty ? "Llene el campo" : null;
                                                    },
                                                  ),
                                                  SizedBox(height: 2.h),
                                                  TextFieldWidget(
                                                    wcontroller: controller.controllerDescription.value,
                                                    whinttext: "Ingrese una descripción",
                                                    wlabeltext: "Descripción",
                                                    validation: (value) {
                                                      return value!.isEmpty ? "Llene el campo" : null;
                                                    },
                                                  ),
                                                  Obx(
                                                    () => DropdownButton2(
                                                      underline: Container(
                                                        color: Colors.purple,
                                                        height: 1,
                                                      ),
                                                      isExpanded: true,
                                                      onChanged: (value) {
                                                        controller.selectUser.value = value as UserModel;
                                                        print(value);
                                                      },
                                                      value: controller.selectUser.value,
                                                      itemHeight: 60,
                                                      iconEnabledColor: Colors.deepPurple,
                                                      selectedItemHighlightColor: Colors.purple[100],
                                                      hint: Text(
                                                        "Seleccionar un usuario",
                                                        style: TextStyle(color: Colors.deepPurple.shade900),
                                                      ),
                                                      style: TextStyle(color: Colors.deepPurple[600]),
                                                      items: controller.listUsers.value
                                                          .map((e) => DropdownMenuItem<UserModel>(value: e, child: Text(e.name!)))
                                                          .toList(),
                                                    ),
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
                                                  SizedBox(height: 5.h),
                                                  ButtonSubmitWidget(
                                                      texto: "Editar usuario",
                                                      pressed: () {
                                                        controller.editTask(index);
                                                      })
                                                ],
                                              ),
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        );
                                        break;
                                      case 2:
                                        controller.deleteTask(controller.listTask.value[index]);
                                        break;
                                    }
                                  }),
                                  title: Text("Título: ${controller.listTask.value[index].title} "),
                                  subtitle: Text("${controller.listTask.value[index].descripcion}"),
                                ),
                              ),
                            );
                          }),
                        ))),
                    Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.itemCountUser.value,
                        itemBuilder: ((context, i) {
                          var index = controller.listUsers.value.indexOf(controller.listUsers.value[i]);
                          return Card(
                            elevation: 9,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                leading: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.person),
                                  ],
                                ),
                                trailing: PopupMenuButton(itemBuilder: ((context) {
                                  return [
                                    PopupMenuItem(value: 1, onTap: () {}, child: Text("Editar")),
                                    PopupMenuItem(
                                      value: 2,
                                      child: Text("Eliminar"),
                                    ),
                                  ];
                                }), onSelected: (value) {
                                  switch (value) {
                                    case 1:
                                      Get.bottomSheet(
                                        SingleChildScrollView(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                                            height: Get.height / 2.2,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                                            width: Get.width,
                                            child: Column(
                                              children: [
                                                TextFieldWidget(
                                                  wcontroller: controller.controllerName.value,
                                                  whinttext: "Ingrese un nombre",
                                                  wlabeltext: "Usuario",
                                                  validation: (value) {
                                                    return value!.isEmpty ? "Llene el campo" : null;
                                                  },
                                                ),
                                                SizedBox(height: 2.h),
                                                TextFieldWidget(
                                                  wcontroller: controller.controllerLastname.value,
                                                  whinttext: "Ingrese el apellido",
                                                  wlabeltext: "Apellido",
                                                  validation: (value) {
                                                    return value!.isEmpty ? "Llene el campo" : null;
                                                  },
                                                ),
                                                SizedBox(height: 5.h),
                                                ButtonSubmitWidget(
                                                    texto: "Editar usuario",
                                                    pressed: () {
                                                      controller.editUser(i);
                                                    })
                                              ],
                                            ),
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      );
                                      break;
                                    case 2:
                                      controller.deleteUser(controller.listUsers.value[index]);
                                      break;
                                  }
                                }),
                                title: Text("Nombre: ${controller.listUsers.value[index].name}"),
                                subtitle: Text("Apellido: ${controller.listUsers.value[index].lastname}"),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          floatingActionButton: SpeedDial(
            child: Icon(Icons.add),
            closedForegroundColor: Colors.black,
            openForegroundColor: Colors.black,
            closedBackgroundColor: Colors.deepPurple[200],
            openBackgroundColor: Colors.deepPurple[600],
            labelsBackgroundColor: Colors.white,
            speedDialChildren: <SpeedDialChild>[
              SpeedDialChild(
                child: FaIcon(FontAwesomeIcons.users),
                foregroundColor: Colors.black,
                backgroundColor: Colors.blue[100],
                label: 'Agregar Usuario',
                onPressed: () async {
                  Get.toNamed(Routes.USER);
                },
              ),
              SpeedDialChild(
                child: Icon(Icons.task),
                foregroundColor: Colors.black,
                backgroundColor: Colors.deepPurple[100],
                label: 'Agregar tarea',
                onPressed: () {
                  Get.toNamed(Routes.TASK);
                },
              ),
              //  Your other SpeedDialChildren go here.
            ],
          ));
    }));
  }
}
