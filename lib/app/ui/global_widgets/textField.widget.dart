import 'package:flutter/material.dart';
class TextFieldWidget extends StatelessWidget {
  final String? wlabeltext;
  final String? whinttext;
  final TextEditingController? wcontroller;
  final String? Function(String?)? validation;
const TextFieldWidget({ Key? key ,this.wcontroller,this.whinttext,this.wlabeltext,this.validation}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextFormField(
      controller: wcontroller ,
      validator: validation,
      decoration: InputDecoration(
        
        labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple.shade600),
        prefixIcon: Icon(Icons.text_fields,color: Colors.deepPurple.shade900,),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        labelText: wlabeltext,
        hintText: whinttext,
        
      ),
    );
  }
}