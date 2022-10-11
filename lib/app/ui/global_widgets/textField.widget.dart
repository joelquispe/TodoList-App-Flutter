import 'package:flutter/material.dart';
class TextFieldWidget extends StatelessWidget {
  final String? wlabeltext;
  final String? whinttext;
  final TextEditingController? wcontroller;
const TextFieldWidget({ Key? key ,this.wcontroller,this.whinttext,this.wlabeltext}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextFormField(
      controller: wcontroller ,
      decoration: InputDecoration(
        labelText: wlabeltext,
        hintText: whinttext,
        
      ),
    );
  }
}