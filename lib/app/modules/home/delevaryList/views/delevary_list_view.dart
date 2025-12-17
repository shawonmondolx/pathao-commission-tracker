import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../Core/Constant_Colors/Colors_Variables.dart';
import '../../../../Core/Constant_Colors/Font_Style.dart';
import '../../../../Core/Custom_widgets/SingelEntry.dart';
import '../../../../data/Data_Model/User_Model.dart';
import '../../widgets/Custom_add.dart';
import '../controllers/delevary_list_controller.dart';

class DelevaryListView extends GetView<DelevaryListController> {
  const DelevaryListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomAdd(
        onPress: () async {
          controller.homeController.pickeDate(context);
        },
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Work History', style: NanoTextStyles.headerStyle),
                InkWell(
                  onTap: () async {
                    print(controller.homeController.name_MonthlyData);
                    await controller.homeController.shareData(context);
                  },
                  child: Image.asset(
                    'Assets/Images/file-sharing.png',
                    scale: 11,
                  ),
                ),
              ],
            ),
            Obx(() {
              final reversedLenth = controller.user.reversed.toList();
              return Expanded(
                child: ListView.builder(
                  itemCount: reversedLenth.length,
                  itemBuilder: (context, index) {
                    final user = reversedLenth[index];
                    return Singelentry(
                      userCommission: user,
                      onPress: () async {
                        await controller.homeController.delete(
                          id: user.id.toString(),
                        );
                      },
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
