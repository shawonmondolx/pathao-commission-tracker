import 'package:flutter/material.dart';

import '../Constant_Colors/Box_Shadow.dart';
import '../Constant_Colors/Colors_Variables.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.ontap});
  final String title;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(boxShadow: NanoStyles.bananaGlow),
            height: screenHeight * 0.06,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: GlobalVariables.primaryBananaAccent,
              ),
              onPressed: ontap,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
