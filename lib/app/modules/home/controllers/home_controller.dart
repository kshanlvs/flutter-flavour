import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tasktwo/app/data/models/user_model.dart';
import 'package:tasktwo/app/data/repository/user_repository.dart';
import 'package:tasktwo/app/routes/app_pages.dart';

class HomeController extends GetxController {
  RxList<UserModel>? listOfUser = <UserModel>[].obs;
  List<UserModel> tempListOfUser = <UserModel>[].obs;
  RxList<UserModel> userListForView = <UserModel>[].obs;
  RxBool loading = false.obs;



   //internet connectivity check

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;


  
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

   Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return _updateConnectionStatus(result);
  }



  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
   if(result == ConnectivityResult.none)
   {
     await getToNoInterNetPage();
    }
    else{
      if(Get.currentRoute == "/no-internet"){
       await  goToPreviousPaget();
      }
    }
  }


  @override
  void onInit() {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.onInit();
  }

  @override
  void onReady() {
      
    getUser();
    super.onReady();
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
  }

   getToNoInterNetPage()  {
     Get.offNamed(Routes.NO_INTERNET);
  }

   goToPreviousPaget() {
    Get.offAndToNamed(Get.previousRoute);
  }
}
