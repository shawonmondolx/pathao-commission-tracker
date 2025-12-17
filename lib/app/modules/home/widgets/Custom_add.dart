import 'package:flutter/material.dart';

import '../../../Core/Constant_Colors/Colors_Variables.dart';
import 'Dialog_Box.dart';

class CustomAdd extends StatelessWidget {
  const CustomAdd({super.key, required this.onPress});
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight * 0.09,
      width: screenWidth * 0.2,
      child: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: GlobalVariables.actionAndPerformance.withOpacity(0.8),
        onPressed: () {
          CustomDialogBox.showDialog(onPress);
        },
        label: Text('+', style: TextStyle(fontSize: screenWidth * 0.1)),
      ),
    );
  }
}
