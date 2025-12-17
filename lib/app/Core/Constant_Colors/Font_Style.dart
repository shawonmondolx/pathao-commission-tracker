import 'package:flutter/material.dart';

import 'Colors_Variables.dart';
import 'Font_Size.dart';
// Import your color file here
// import 'global_variables.dart';

class NanoTextStyles {
  // 1. The Big Income Text (Black text on Yellow Background)
  static const TextStyle bigMoneyStyle = TextStyle(
    fontSize: GlobalFontSizes.displayIncome,
    fontWeight: FontWeight.w900, // Extra Bold
    color: GlobalVariables.incomeAndSuccess,
    fontFamily: 'Nunito',
  );

  // 2. Page Headers (White text on Dark Background)
  static const TextStyle headerStyle = TextStyle(
    fontSize: GlobalFontSizes.pageHeader,
    fontWeight: FontWeight.bold,
    color: GlobalVariables.textPrimary,
    fontFamily: 'Nunito',
  );

  // 3. Stat Numbers (White/Green text)
  static const TextStyle statNumberStyle = TextStyle(
    fontSize: GlobalFontSizes.statValue,
    fontWeight: FontWeight.w800,
    color: GlobalVariables.textPrimary,
    fontFamily: 'Nunito',
  );

  // 4. List Item Title (Standard White Text)
  static const TextStyle listTitleStyle = TextStyle(
    fontSize: GlobalFontSizes.listTitle,
    fontWeight: FontWeight.w600,
    color: GlobalVariables.textPrimary,
    fontFamily: 'Nunito',
  );

  // 5. List Item Amount (Neon Green Text)
  static const TextStyle listAmountStyle = TextStyle(
    fontSize: GlobalFontSizes.listAmount,
    fontWeight: FontWeight.bold,
    color: GlobalVariables.incomeAndSuccess,
    fontFamily: 'Nunito',
  );

  // 6. Subtitles/Dates (Grey Text)
  static const TextStyle subtitleStyle = TextStyle(
    fontSize: GlobalFontSizes.listSubtitle,
    fontWeight: FontWeight.normal,
    color: GlobalVariables.textSecondary,
    fontFamily: 'Nunito',
  );
}
