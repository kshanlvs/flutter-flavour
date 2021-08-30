import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tasktwo/app/routes/app_pages.dart';
import 'package:tasktwo/app/theme.dart';
import 'package:tasktwo/resources/app_config.dart';

void main() {
  const bool isDev = false;
  var configuredApp;
  if (isDev == true) {
    configuredApp = AppConfig(
      appTitle: "Flutter flavours Developement (target1)",
      buildFlavour: "Development",
      themeData: getThemedata("development"),
      child: MyApp(),
    );
  } else {
    configuredApp = AppConfig(
      appTitle: "Flutter flavour (target 2)",
      buildFlavour: "Production",
      themeData: getThemedata("production"),
      child: MyApp(),
    );
  }

  return runApp(configuredApp);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      title: AppConfig.of(context)!.appTitle!,
      debugShowCheckedModeBanner: false,
      theme: AppConfig.of(context)!.themeData,
    );
  }
}
