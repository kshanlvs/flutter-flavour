import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tasktwo/app/data/models/user_model.dart';

import '../controllers/user_detail_controller.dart';

class UserDetailView extends GetView<UserDetailController> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
            title: Text(
              "Personal Detail",
              style: TextStyle(color: Color(0XFF8096A8), fontSize: 24),
            ),
          ),
          SizedBox(
            height: Get.height * .04,
          ),
          Obx(() {
            UserModel userDetail = controller.userModel!.value;
            return Container(
              width: Get.width,
              alignment: Alignment.center,
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: userDetail.id.toString(),
                    child: Image.asset(
                      "assets/images/user.png",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  ListTile(
                    title: Center(child: Text(userDetail.name!)),
                    subtitle: Center(child: Text(userDetail.email!)),
                  ),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        UserDetailFields(
                          iconData: Icons.business,
                          feildValue: userDetail.company!.name!,
                        ),
                        UserDetailFields(
                          iconData: Icons.call,
                          feildValue: userDetail.phone!,
                        ),
                        UserDetailFields(
                          iconData: Icons.location_city,
                          feildValue: userDetail.address!.street!,
                          addString: userDetail.address!.city!,
                        ),
                        UserDetailFields(
                          iconData: Icons.map,
                          feildValue: userDetail.address!.zipcode!,
                        ),
                        UserDetailFields(
                          iconData: Icons.web,
                          feildValue: userDetail.website!,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    ));
  }
}

class UserDetailFields extends StatelessWidget {
  const UserDetailFields({
    Key? key,
    required this.iconData,
    required this.feildValue,
    this.addString = "",
  }) : super(key: key);

  final IconData iconData;
  final String feildValue;
  final String addString;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(feildValue + " " + "${addString}"),
    );
  }
}
