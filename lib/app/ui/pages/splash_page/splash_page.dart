
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controllers/splash_controller.dart';


class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${controller.title}",style: TextStyle(color: Colors.purple,fontSize: 35,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Lottie.asset("assets/task.json",height: 350)
          ],),
      ),)
    );
  }
}
  