
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/users_controller.dart';


class UsersPage extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UsersPage'),
      ),
      body: SafeArea(
        child: Text('UsersController'),
      ),
    );
  }
}
  