import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pathao_heros/app/Core/Constant_Colors/Colors_Variables.dart';

import 'app/data/Api_Services.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => ApiServices().init());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.scaffoldBackground,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: GlobalVariables.textPrimary),
        ),
      ),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
