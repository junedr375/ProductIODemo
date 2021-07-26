import 'package:easyshop/Screens/SplashScreen.dart';
import 'package:easyshop/Utils/appThemeData.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'EasyShop',
        debugShowCheckedModeBanner: false,
        theme: appLightTheme(),
        darkTheme: appDarkTheme(),
        themeMode: ThemeMode.system,
        home: SplashScreen());
  }
}
