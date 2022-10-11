import 'package:apptask/app/bindings/splash_binding.dart';
import 'package:apptask/app/routes/app_routes.dart';
import 'package:apptask/app/routes/page_routes.dart';
import 'package:apptask/app/ui/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.SPLASH,
        
        defaultTransition: Transition.fade,
        initialBinding: SplashBinding(),
        getPages: AppPages.pages,
        home: SplashPage(),
    )
  );
}