import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pathao_heros/app/data/Api_Services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../routes/app_pages.dart';
import '../../../home/controllers/home_controller.dart';

class SingupController extends GetxController {
  // variables
  RxString name = ''.obs;
  RxString phone = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;
  RxString livepass = ''.obs;
  RxString raiderId = ''.obs;
  RxString selectectedArea = 'Inside City'.obs;
  RxList<String> Area = RxList(['Inside City', 'Outside City']);

  //   Methods
  Future<void> signupUser() async {
    try {
      final response = await ApiServices().to.client.auth.signUp(
        email: email.value,
        password: password.value,
      );

      if (response.user != null) {
        Get.offAllNamed(Routes.HOME);
        Get.snackbar('Success', 'Account created successfully!');
      }
    } on AuthException catch (e) {
      Get.snackbar('Error', e.message);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> saveAgentType() async {
    try {
      final user = ApiServices().to.client;
      final res = await user.from('userinfo').insert({
        'agent_type': selectectedArea.value,
        'user_name': name.value,
        'email': email.value,
      });
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userId', user.auth.currentUser!.id);
    } catch (e) {
      print(e);
    }
  }
}
