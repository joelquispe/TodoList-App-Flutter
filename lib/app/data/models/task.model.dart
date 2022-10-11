import 'package:apptask/app/data/models/user.model.dart';

class Task {
  String? id;
  String? title;
  String? descripcion;
  String? priority;
  UserModel? userModel;

  Task({this.id, this.title, this.descripcion, this.priority, this.userModel});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    descripcion = json['descripcion'];
    priority = json['priority'];
    userModel = json['UserModel'] != null
        ? new UserModel.fromJson(json['UserModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['descripcion'] = this.descripcion;
    data['priority'] = this.priority;
    if (this.userModel != null) {
      data['UserModel'] = this.userModel!.toJson();
    }
    return data;
  }
}