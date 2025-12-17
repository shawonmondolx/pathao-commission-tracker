import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../Core/Constant_Colors/Image_Manager.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(ImageManager.logo, width: screenWidth * 0.8),
      ),
    );
  }
}
