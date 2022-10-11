import 'package:apptask/app/ui/global_widgets/textField.widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/tasks_controller.dart';

class TasksPage extends GetView<TasksController> {
  @override
  Widget build(BuildContext context) {
    final controllerTitle = TextEditingController();
    final controllerDescription = TextEditingController();

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TextFieldWidget(
          wcontroller: controllerTitle,
          whinttext: "Ingrese un titulo",
          wlabeltext: "Titulo",
        ),
        TextFieldWidget(
            wcontroller: controllerDescription,
            whinttext: "Ingrese una descripción",
            wlabeltext: "Descripción"),
        Container(
          width: 100,
          
          child: DropdownButton2(
              onChanged: (value) {
                print(value);
              },
              itemHeight: 40,
              value: 1,
              hint: Text("Prioridad"),
              items: [
                DropdownMenuItem(
                  child: Text("Alta"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Media"),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("Baja"),
                  value: 3,
                )
              ]),
        )
      ],
    )));
  }
}
