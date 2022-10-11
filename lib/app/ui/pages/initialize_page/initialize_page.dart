import 'package:apptask/app/routes/app_routes.dart';
import 'package:apptask/app/ui/pages/tasks_page/tasks_page.dart';
import 'package:apptask/app/ui/pages/users_page/users_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import '../../../controllers/initialize_controller.dart';

class InitializePage extends GetView<InitializeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              backgroundColor: Colors.deepPurple[400],
              automaticallyImplyLeading: false,
              title: Text("Mis tareas",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            SliverToBoxAdapter(
              child: TabBar(
                  indicatorColor: Colors.purple,
                  controller: controller.tabController,
                  tabs: [
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
                child:
                    TabBarView(controller: controller.tabController, children: [
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        onTap: () {
                          Get.dialog(Text("joel"));
                        },
                        title: Text("${index}"),
                      );
                    }),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 20,
                    itemBuilder: ((context, index) {
                      return Card(
                        elevation: 9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            leading: Icon(Icons.person),
                            trailing: PopupMenuButton(itemBuilder: ((context) {
                              return [
                                PopupMenuItem(
                                    value: 1,
                                    onTap: () {},
                                    child: Text("Editar")),
                                PopupMenuItem(
                                  value: 2,
                                  child: Text("Eliminar"),
                                  onTap: () {
                                    Get.dialog(Text("Usuario eliminado"));
                                  },
                                ),
                              ];
                            }), onSelected: (value) {
                              switch (value) {
                                case 1:
                                  Get.bottomSheet(
                                    Container(
                                      height: Get.height / 2,
                                      child: Column(
                                        children: [TextFormField()],
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  );
                                  break;
                              }
                            }),
                            title: Text("${index}"),
                            subtitle: Text("Descripción"),
                          ),
                        ),
                      );
                    }),
                  )
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
              onPressed: () {
                Get.toNamed(Routes.TASK);
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
  }
}
