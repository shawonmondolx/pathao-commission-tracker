import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathao_heros/app/Core/Constant_Colors/Colors_Variables.dart';
import 'package:pathao_heros/app/Core/Custom_widgets/Custom_TextFom.dart';
import 'package:pathao_heros/app/Core/Custom_widgets/Custom_button.dart';
import '../../../../Core/Constant_Colors/Font_Style.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/singup_controller.dart';

class SingupView extends GetView<SingupController> {
  SingupView({super.key});
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                top: screenHeight * 0.15,
                left: screenWidth * 0.02,
                right: screenWidth * 0.02,
              ),
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Join The Fleet', style: NanoTextStyles.headerStyle),
                      SizedBox(height: screenHeight * 0.07),

                      // Form
                      Form(
                        key: _keyForm,
                        child: Column(
                          children: [
                            CustomTextfom(
                              validate: (value) =>
                                  value!.isEmpty ? 'Name is required' : null,
                              onSaved: (value) =>
                                  controller.name.value = value!,
                              hint: 'Name',
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            CustomTextfom(
                              validate: (value) =>
                                  value!.isEmpty ? 'Phone required' : null,
                              onSaved: (value) =>
                                  controller.phone.value = value!,
                              hint: 'Phone Number',
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            CustomTextfom(
                              validate: (value) =>
                                  value!.isEmpty ? 'Email is required' : null,
                              onSaved: (value) =>
                                  controller.email.value = value!,
                              hint: 'Email',
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            CustomTextfom(
                              onchange: (value) {
                                controller.livepass.value = value;
                                print(controller.livepass);
                              },
                              validate: (value) => value!.isEmpty
                                  ? 'Password is required'
                                  : null,
                              onSaved: (value) =>
                                  controller.password.value = value!,
                              hint: 'Password',
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            CustomTextfom(
                              validate: (value) =>
                                  value != controller.livepass.value
                                  ? 'Passwords do not match'
                                  : null,
                              hint: 'Confirm Password',
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            CustomTextfom(
                              validate: (value) => value!.isEmpty
                                  ? 'Raider Id is required'
                                  : null,
                              onSaved: (value) =>
                                  controller.raiderId.value = value!,
                              hint: 'Raider Id',
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      // Dropdown
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.04,
                          vertical: screenHeight * 0.005,
                        ),
                        decoration: BoxDecoration(
                          color: GlobalVariables.scaffoldBackground,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white54.withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        child: Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: controller.selectectedArea.value,
                              dropdownColor: Colors.black87,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              items: controller.Area.map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ).toList(),
                              onChanged: (value) =>
                                  controller.selectectedArea.value = value!,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.07),

                      // Buttons
                      CustomButton(
                        title: 'SingUp',
                        ontap: () async {
                          if (_keyForm.currentState!.validate()) {
                            _keyForm.currentState!.save();
                            await controller.signupUser();
                            await controller.saveAgentType();
                          }
                        },
                      ),

                      SizedBox(height: screenHeight * 0.02),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () => Get.toNamed(Routes.LOGIN),
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.04,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height:
                            MediaQuery.of(context).viewInsets.bottom +
                            screenHeight * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
