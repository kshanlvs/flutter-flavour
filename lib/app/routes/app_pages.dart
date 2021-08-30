import 'package:get/get.dart';

import 'package:tasktwo/app/modules/home/bindings/home_binding.dart';
import 'package:tasktwo/app/modules/home/views/home_view.dart';
import 'package:tasktwo/app/modules/user_detail/bindings/user_detail_binding.dart';
import 'package:tasktwo/app/modules/user_detail/views/user_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.USER_DETAIL,
      page: () => UserDetailView(),
      binding: UserDetailBinding(),
    ),
  ];
}
