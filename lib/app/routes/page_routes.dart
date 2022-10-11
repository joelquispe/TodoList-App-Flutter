import 'package:apptask/app/bindings/initialize_binding.dart';
import 'package:apptask/app/bindings/splash_binding.dart';
import 'package:apptask/app/bindings/tasks_binding.dart';
import 'package:apptask/app/bindings/users_binding.dart';
import 'package:apptask/app/routes/app_routes.dart';
import 'package:apptask/app/ui/pages/initialize_page/initialize_page.dart';
import 'package:apptask/app/ui/pages/splash_page/splash_page.dart';
import 'package:apptask/app/ui/pages/tasks_page/tasks_page.dart';
import 'package:apptask/app/ui/pages/users_page/users_page.dart';
import 'package:get/get.dart';


abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.INITIALIZE, page:()=> InitializePage(),binding: InitializeBinding()),
    GetPage(name: Routes.SPLASH, page:()=> SplashPage(), binding:SplashBinding() ),
    GetPage(name: Routes.TASK, page: ()=> TasksPage(),binding: TasksBinding(),transition: Transition.downToUp),
    GetPage(name: Routes.USER, page:()=> UsersPage(), binding:UsersBinding() ,transition: Transition.downToUp),
  ];
}