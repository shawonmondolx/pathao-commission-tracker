import 'package:get/get.dart';

import '../controllers/delevary_list_controller.dart';

class DelevaryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DelevaryListController());
  }
}
