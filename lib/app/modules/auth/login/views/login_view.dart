import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pathao_heros/app/Core/Constant_Colors/Colors_Variables.dart';

import '../../../../Core/Constant_Colors/Font_Style.dart';
import '../../../../Core/Custom_widgets/Custom_TextFom.dart';
import '../../../../Core/Custom_widgets/Custom_button.dart';
import '../../../../data/Api_Services.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.scaffoldBackground,
        title: const Text('LogIn', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.1,
            left: screenWidth * 0.02,
            right: screenWidth * 0.02,
            bottom: screenHeight * 0.04,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome Back', style: NanoTextStyles.headerStyle),
              SizedBox(height: screenHeight * 0.04),
              Form(
                key: _keyForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextfom(
                      onSaved: (newValue) {
                        controller.email.value = newValue!;
                      },
                      hint: 'Email',
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!value.contains('@')) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextfom(
                      onSaved: (newValue) {
                        controller.password.value = newValue!;
                      },
                      hint: 'Password',
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.04),
              Obx(
                () => controller.isloading.value
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : CustomButton(
                        title: 'LogIn',
                        ontap: () async {
                          if (_keyForm.currentState!.validate()) {
                            _keyForm.currentState!.save();
                            await controller.loginUser();
                            await controller.saveUserId();
                          }
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
