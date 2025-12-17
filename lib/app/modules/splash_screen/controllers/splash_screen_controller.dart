import 'dart:async';

import 'package:get/get.dart';
import 'package:pathao_heros/app/data/Api_Services.dart';

import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () => initialRoute());
  }

  void initialRoute() {
    final user = ApiServices().to.client.auth.currentUser;
    if (user != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.SINGUP);
    }
  }
}
