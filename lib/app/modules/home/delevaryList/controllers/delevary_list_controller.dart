import 'package:get/get.dart';
import 'package:pathao_heros/app/modules/home/controllers/home_controller.dart';
import '../../../../data/Data_Model/User_Model.dart';

class DelevaryListController extends GetxController {
  final homeController = Get.find<HomeController>();
  RxList<UserCommission> get user => homeController.userCommissions;

  @override
  void onInit() {
    super.onInit();
  }
}
