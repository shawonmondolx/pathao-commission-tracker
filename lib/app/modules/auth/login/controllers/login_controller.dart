import 'package:get/get.dart';
import 'package:pathao_heros/app/data/Api_Services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //   Variables
  RxString email = RxString('');
  RxString password = RxString('');
  RxBool isloading = RxBool(false);

  // Methods
  Future<void> loginUser() async {
    isloading.value = true;
    try {
      final response = await ApiServices().to.client.auth.signInWithPassword(
        email: email.value,
        password: password.value,
      );

      if (response.user != null) {
        Get.offAllNamed(Routes.HOME);
        Get.snackbar('Success', 'Logged in successfully!');
      }
    } on AuthException catch (e) {
      Get.snackbar('Error', e.message);
      print(e);
    } catch (e) {
      isloading.value = false;
      Get.snackbar('Error', e.toString());
      print(e);
    }
  }

  Future<void> saveUserId() async {
    final user = ApiServices().to.client;
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userId', user.auth.currentUser!.id);
      isloading.value = false;
    } catch (e) {
      isloading.value = false;
      print(e);
    }
  }
}
