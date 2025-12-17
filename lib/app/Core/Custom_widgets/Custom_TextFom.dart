import 'package:flutter/material.dart';

import '../Constant_Colors/Colors_Variables.dart';

class CustomTextfom extends StatelessWidget {
  const CustomTextfom({
    super.key,
    required this.hint,
    this.onSaved,
    this.validate,
    this.onchange,
    this.inputType,
  });
  final String hint;
  final FormFieldSetter<String>? onSaved;
  final void Function(String)? onchange;
  final FormFieldValidator<String>? validate;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return TextFormField(
      keyboardType: inputType,
      onChanged: onchange,
      onSaved: onSaved,
      validator: validate,
      decoration: InputDecoration(
        filled: true,
        fillColor: GlobalVariables.inputRecessedBackground,
        hintText: hint,
        hintStyle: TextStyle(color: GlobalVariables.placeholderText),
        contentPadding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.06,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // Pill shape
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ), // No border for the "soft" look
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: GlobalVariables.inputFocusBorder,
            width: 2,
          ),
        ),
      ),
    );
  }
}
