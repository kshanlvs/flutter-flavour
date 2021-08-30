import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tasktwo/app/data/models/user_model.dart';
import 'package:tasktwo/app/modules/user_detail/controllers/user_detail_controller.dart';
import 'package:tasktwo/resources/app_config.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final controller = Get.put(HomeController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size(Get.width, 170),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: TextField(
                      onChanged: controller.searchUser,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(13),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          suffixIcon: Icon(Icons.search),
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Search User............",
                          fillColor: Colors.white70),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    subtitle: Obx(
                      () {
                        if (controller.listOfUser!.isEmpty) {
                          return SizedBox.shrink();
                        } else {
                          return Text(
                              "Total users: ${controller.listOfUser?.length.toString() ?? 0}");
                        }
                      },
                    ),
                    title: Text(
                      "User List",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.blueGrey),
                    ),
                    trailing: Icon(
                      Icons.grid_view,
                      size: 40,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        title: Text(AppConfig.of(context)!.appTitle!),
        centerTitle: false,
      ),
      body: Center(
        child: Obx(
          () {
            
            if (controller.loading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {

              if(controller.userListForView.isEmpty){
                return Center(child: Text("No Data found"));
              }
              else
              return SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.userListForView.length,
                      itemBuilder: (BuildContext context, int index) {
                        UserModel singleUser =
                            controller.userListForView[index];
                        return InkWell(
                          onTap: () async {
                            await UserDetailController.to
                                .getUserDetailAntGoToUserDetailPage(
                                    userDetails: singleUser);
                          },
                          child: ListTile(
                            leading: Hero(
                              tag: singleUser.id.toString(),
                              child: Image.asset(
                                "assets/images/user.png",
                                height: 30,
                                width: 30,
                              ),
                            ),
                            trailing: Icon(
                              Icons.link,
                              color: Colors.amber,
                            ),
                            title: Text('${singleUser.name}'),
                            subtitle: Text(singleUser.email.toString()),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
