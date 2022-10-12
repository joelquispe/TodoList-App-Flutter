
import 'package:apptask/app/ui/global_widgets/buttonSubmit.widget.dart';
import 'package:apptask/app/ui/global_widgets/textField.widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/users_controller.dart';


class UsersPage extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    final fkey = GlobalKey<FormState>();
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: Get.width / 1.2,
        child: Form(
          key: fkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                wcontroller: controller.controllerName.value,
                whinttext: "Ingrese un nombre",
                wlabeltext: "Nombre",
                validation: (value) {
                  return value!.isEmpty ? "Llenar campo" : null;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFieldWidget(
                wcontroller: controller.controllerLastName.value,
                whinttext: "Ingrese un apellido",
                wlabeltext: "Apellido",
                validation: (value) {
                  return value!.isEmpty ? "Llenar campo" : null;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFieldWidget(
                wcontroller: controller.controllerPhone.value,
                whinttext: "Ingrese un teléfono",
                wlabeltext: "Teléfono",
                validation: (value) {
                  return value!.isEmpty ? "Llenar campo" : null;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFieldWidget(
                wcontroller: controller.controllerEmail.value,
                whinttext: "Ingrese un correo",
                wlabeltext: "Correo",
                validation: (value) {
                  return value!.isEmpty ? "Llenar campo" : null;
                },
              ),
              
             
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
                              controller.createUser();
                              Fluttertoast.showToast(
                                  msg: "Usuario creado correctamente",
                                  backgroundColor: Colors.deepPurple,
                                  textColor: Colors.white);
                              Get.back();

                            }
                          },
                          texto: "Crear Usuario",
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
    )));
  }
}
  