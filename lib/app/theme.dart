import 'package:flutter/material.dart';

ThemeData getThemedata(String flavour) {
  switch (flavour) {
    case "development":
      return themeDevelopment();
    case "production":
      return themeProduction();
    default:
      return defaultTheme();
  }
}

ThemeData themeProduction() {
  return ThemeData(appBarTheme: appBarThemeProduction());
}

AppBarTheme appBarThemeProduction() {
  return AppBarTheme(color: Colors.grey[700]);
}

ThemeData defaultTheme() {
  return ThemeData(appBarTheme: appBarThemeForDefault());
}

AppBarTheme appBarThemeForDefault() {
  return AppBarTheme(color: Colors.blue);
}

ThemeData themeDevelopment() {
  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: appBarThemeDevelopment(),
    iconTheme: iconThemeDataForDevelopment(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}

ThemeData dark() {
  return ThemeData(
    brightness: Brightness.dark,
  );
}

IconThemeData iconThemeDataForDevelopment() {
  return IconThemeData(color: Colors.amber);
}

AppBarTheme appBarThemeDevelopment() {
  return AppBarTheme(
    color: Colors.amber[800],
    elevation: 5,
    textTheme: TextTheme(
      headline6: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    // borderSide: BorderSide(color: Colors.grey[100]),
    gapPadding: 5,
  );
  return InputDecorationTheme(
      //floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
      filled: true,
      fillColor: Colors.white);
}
