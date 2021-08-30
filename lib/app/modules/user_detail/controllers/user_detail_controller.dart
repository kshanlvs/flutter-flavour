import 'dart:async';

import 'package:get/get.dart';
import 'package:tasktwo/app/data/models/user_model.dart';
import 'package:tasktwo/app/routes/app_pages.dart';

class UserDetailController extends GetxController {
  static UserDetailController get to => Get.find();
  Rx<UserModel>? userModel = UserModel().obs;

  Future getUserDetailAntGoToUserDetailPage({UserModel? userDetails}) async {
    userModel?.value = userDetails!;
    print(userDetails?.name);
    if (userModel?.value != null) {
      Get.toNamed(Routes.USER_DETAIL);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
