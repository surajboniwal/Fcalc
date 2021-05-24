import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calc/bindings/home.dart';
import 'package:flutter_calc/screens/home.dart';
import 'package:flutter_calc/themes/apptheme.dart';
import 'package:get/get.dart';

void main() {
  runApp(EasyDynamicThemeWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FCalc',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      theme: AppTheme.getApplicationThemeLight(context),
      darkTheme: AppTheme.getApplicationThemeDark(context),
      themeMode: EasyDynamicTheme.of(context).themeMode!,
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}
