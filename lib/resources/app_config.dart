import "package:meta/meta.dart";
import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final String? appTitle;
  final String? buildFlavour;
  final Widget child;
  final ThemeData themeData;

  AppConfig(
      {@required this.appTitle,
      @required this.buildFlavour,
      required this.themeData,
      required this.child})
      : super(child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: AppConfig);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
