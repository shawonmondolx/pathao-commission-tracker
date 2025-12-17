import 'package:flutter/material.dart';

import 'Colors_Variables.dart';

class NanoStyles {
  // Shadow for the Yellow Buttons/Cards to make them look like 3D plastic
  static List<BoxShadow> bananaGlow = [
    BoxShadow(
      color: GlobalVariables.primaryBananaAccent.withOpacity(0.4),
      blurRadius: 12,
      offset: const Offset(0, 2), // Pushes shadow down for 3D effect
      spreadRadius: 0,
    ),
  ];

  // Shadow for the Dark Cards (Stats/History)
  static List<BoxShadow> darkPlasticShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      blurRadius: 10,
      offset: const Offset(4, 4),
    ),
    BoxShadow(
      color: Colors.white.withOpacity(0.05), // Subtle highlight on top
      blurRadius: 10,
      offset: const Offset(-2, -2),
    ),
  ];
}
