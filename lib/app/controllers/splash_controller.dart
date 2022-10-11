import 'package:apptask/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  String title = "Mis tareas";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 4), () {
      Get.toNamed(Routes.INITIALIZE);
    });
  }
}
