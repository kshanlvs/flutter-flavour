import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/no_internet_controller.dart';

class NoInternetView extends GetView<NoInternetController> {
  Future<bool> onWillPop(){
    return Future.value(false);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            AspectRatio(aspectRatio: 1,child: Image.asset("assets/images/no_internet.jpg"),),
    
            Text("No Internet Connection!!",style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        )
      ),
    );
  }
}