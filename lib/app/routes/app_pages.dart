import 'package:get/get.dart';
import 'package:reparasi_computer/app/modules/Reparasi/Bottom%20Bar/bottomBar.dart';
import 'package:reparasi_computer/app/modules/Reparasi/reparasi.dart';

import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(name: _Paths.REPARASI, page: () => Reparasi()),
    GetPage(name: _Paths.BOTTOMBAR, page: () => BottomBar())
  ];
}
