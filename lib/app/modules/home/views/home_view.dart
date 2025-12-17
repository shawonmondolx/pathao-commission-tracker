import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pathao_heros/app/Core/Constant_Colors/Colors_Variables.dart';
import 'package:pathao_heros/app/data/Api_Services.dart';
import 'package:pathao_heros/app/data/Data_Model/User_Model.dart';

import '../../../Core/Constant_Colors/Box_Shadow.dart';
import '../../../Core/Constant_Colors/Font_Style.dart';
import '../../../Core/Custom_widgets/Month_List.dart';
import '../../../Core/Custom_widgets/SingelEntry.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../widgets/Custom_add.dart';
import '../widgets/Dialog_Box.dart';
import '../widgets/ProgressBar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: CustomAdd(
        onPress: () async {
          controller.pickeDate(context);
        },
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.07,
            left: screenWidth * 0.01,
            right: screenWidth * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                height: screenHeight * 0.28,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: NanoStyles.darkPlasticShadow,
                  color: GlobalVariables.secondaryCardSurface,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.05,
                          bottom: screenHeight * 0.02,
                          right: screenWidth * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white),
                                ),
                                child: DropdownButton<int>(
                                  underline: SizedBox(),
                                  dropdownColor:
                                      GlobalVariables.scaffoldBackground,
                                  value: controller
                                      .currentYear
                                      .value, // selected year
                                  items: controller.years.map((year) {
                                    return DropdownMenuItem(
                                      value: year,
                                      child: Text(
                                        year.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.currentYear.value = value;
                                      controller.saveDate(); // update year
                                      controller
                                          .getData(); // reload your data if needed
                                    }
                                  },
                                ),
                              ),
                            ),

                            MonthList(),
                          ],
                        ),
                      ),
                      Text('Total Income', style: NanoTextStyles.bigMoneyStyle),
                      Obx(
                        () => Text(
                          '${controller.totalMothlyIncome} Taka',
                          style: NanoTextStyles.bigMoneyStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: screenHeight * 0.2,
                      width: screenWidth * 0.28,
                      decoration: BoxDecoration(
                        boxShadow: NanoStyles.darkPlasticShadow,
                        color: GlobalVariables.secondaryCardSurface,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.02),
                        child: Column(
                          children: [
                            Obx(() {
                              final value =
                                  controller.totalMothlyPerformence.value;

                              if (value == 'NaN' || value.isEmpty) {
                                return PerformanceCircle(
                                  value: 0,
                                  size: screenWidth * 0.2,
                                );
                              }

                              return PerformanceCircle(
                                value: double.tryParse(value) ?? 0,
                                size: screenWidth * 0.2,
                              );
                            }),

                            SizedBox(height: screenHeight * 0.012),
                            Text(
                              'Performance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Obx(
                              () => Text(
                                controller.totalMothlyPerformence.value == 'NaN'
                                    ? '0'
                                    : ' ${controller.totalMothlyPerformence.value} %',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.2,
                      width: screenWidth * 0.28,
                      decoration: BoxDecoration(
                        boxShadow: NanoStyles.darkPlasticShadow,
                        color: GlobalVariables.secondaryCardSurface,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.02,
                          left: screenWidth * 0.02,
                          right: screenWidth * 0.02,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'Assets/Images/box.png',
                              height: screenWidth * 0.2,
                              width: screenWidth * 0.2,
                              color: Colors.white,
                            ),
                            SizedBox(height: screenHeight * 0.012),

                            Text(
                              'Total Parcel',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Obx(
                              () => Text(
                                controller.totalMothlyParcel.value,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.2,
                      width: screenWidth * 0.28,
                      decoration: BoxDecoration(
                        boxShadow: NanoStyles.darkPlasticShadow,
                        color: GlobalVariables.secondaryCardSurface,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.02,
                          left: screenWidth * 0.02,
                          right: screenWidth * 0.02,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              size: screenWidth * 0.2,
                              color: Colors.white,
                            ),
                            SizedBox(height: screenHeight * 0.012),
                            Text(
                              'Attendance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Obx(
                              () => Text(
                                controller.atendanse.value,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Entries",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Get.toNamed(
                        Routes.DELEVARY_LIST,
                        arguments: controller.userCommissions,
                      );
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() {
                final List<UserCommission> latest = controller
                    .userCommissions
                    .reversed
                    .take(2)
                    .toList();
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 0),
                    itemCount: latest.length,
                    itemBuilder: (context, index) {
                      final userDetails = latest[index];
                      return controller.isloading.value
                          ? CircularProgressIndicator(color: Colors.red)
                          : Singelentry(
                              userCommission: userDetails,
                              onPress: () {
                                controller.delete(
                                  id: userDetails.id.toString(),
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
      ),
    );
  }
}
