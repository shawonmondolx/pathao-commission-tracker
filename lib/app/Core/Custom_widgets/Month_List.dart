import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../modules/home/controllers/home_controller.dart';
import '../Constant_Colors/Colors_Variables.dart';

class MonthList extends StatefulWidget {
  const MonthList({super.key});
  @override
  State<MonthList> createState() => _MonthListState();
}

class _MonthListState extends State<MonthList> {
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Obx(
        () => DropdownButton(
          underline: SizedBox(),
          dropdownColor: GlobalVariables.scaffoldBackground,
          value: controller.selectedMonth.value,
          items: List.generate(12, (index) {
            return DropdownMenuItem(
              value: index + 1,
              child: Text(
                controller.months[index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }),
          onChanged: (value) async {
            controller.selectedMonth.value = value!;
            await controller.getData();
            await controller.saveDate();
            print(controller.selectedMonth);
          },
        ),
      ),
    );
  }
}
