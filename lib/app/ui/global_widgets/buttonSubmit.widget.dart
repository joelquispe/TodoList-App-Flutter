import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ButtonSubmitWidget extends StatelessWidget {
  final String texto;
  final void Function()? pressed;

  const ButtonSubmitWidget({Key? key,required this.texto,required this.pressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        height: 5.h,
        width: 37.w,
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)),
        child: Align(
            alignment: Alignment.center,
            child: Text(
              texto,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
