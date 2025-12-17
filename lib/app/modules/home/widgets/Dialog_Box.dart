import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathao_heros/app/Core/Constant_Colors/Colors_Variables.dart';
import 'package:pathao_heros/app/Core/Custom_widgets/Custom_TextFom.dart';

import '../controllers/home_controller.dart';

class CustomDialogBox {
  static void showDialog(VoidCallback onPress) {
    final _keyform = GlobalKey<FormState>();
    final controller = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(Get.context!).size.width;
    final screenHeight = MediaQuery.of(Get.context!).size.height;

    Get.defaultDialog(
      title: 'Add New Entry',
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: screenWidth * 0.05,
        color: Colors.white,
      ),
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Date:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              IconButton(
                onPressed: onPress,
                icon: const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Form(
            key: _keyform,
            child: Column(
              children: [
                CustomTextfom(
                  onSaved: (value) {
                    controller.totalAssignedParcel.value = int.parse(value!);
                  },
                  hint: 'Total Assigned Parcel',
                  inputType: TextInputType.number,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Total Assigned Parcel';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Only numbers allowed for Total Assigned Parcel';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomTextfom(
                  onSaved: (value) {
                    controller.totalDelivery.value = int.parse(value!);
                  },
                  hint: 'Total Delivery',
                  inputType: TextInputType.number,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Total Delivery';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Only numbers allowed for Total Delivery';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: GlobalVariables.scaffoldBackground,
      radius: 20,
      contentPadding: EdgeInsets.all(screenWidth * 0.05),
      actions: [
        TextButton(
          onPressed: () async {
            if (_keyform.currentState!.validate()) {
              _keyform.currentState!.save();
              Get.back();
              await controller.savedelavery();
              await controller.getData();
            }
          },
          child: const Text("OK", style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
