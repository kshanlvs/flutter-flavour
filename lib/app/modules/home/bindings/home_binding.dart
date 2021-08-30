import 'package:get/get.dart';
import 'package:tasktwo/app/modules/user_detail/controllers/user_detail_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(UserDetailController(), permanent: true);
  }
}
