import 'package:get/get.dart';
import 'package:tasktwo/app/data/models/user_model.dart';
import 'package:tasktwo/app/data/repository/user_repository.dart';

class HomeController extends GetxController {
  RxList<UserModel>? listOfUser = <UserModel>[].obs;
  List<UserModel> tempListOfUser = <UserModel>[].obs;
  RxList<UserModel> userListForView = <UserModel>[].obs;
  RxBool loading = false.obs;

  // get  user data 
  getUser() async {
    try {
      loading.value = true;
      var response = await UserRepository().getUserData();
      loading.value = false;
      response.forEach((json) {
        UserModel tempModel = UserModel.fromJson(json);
        listOfUser!.add(tempModel);
      });
      userListForView.assignAll(listOfUser!);
    } catch (e) {
      print(e);
    }
  }


  // search the user from the user list 
  searchUser(value) {
    List<UserModel> dublicate = [];
    dublicate = listOfUser!;
    if (value.toString().isEmpty) {
      userListForView.value = dublicate;
    } else {
      List<UserModel> dublicate2 = [];
      listOfUser!.forEach(
        (element) {
          if (element.name!
              .toLowerCase()
              .contains(value.toString().toLowerCase())) {
            dublicate2.add(element);
          }
        },
      );
      userListForView.value = dublicate2;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getUser();
    super.onReady();
  }

  @override
  void onClose() {
    
  }
}
