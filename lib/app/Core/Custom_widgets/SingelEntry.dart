import 'package:flutter/material.dart';
import '../../data/Data_Model/User_Model.dart';
import '../Constant_Colors/Box_Shadow.dart';
import '../Constant_Colors/Colors_Variables.dart';
import '../Constant_Colors/Font_Style.dart';

class Singelentry extends StatelessWidget {
  const Singelentry({
    super.key,
    required this.userCommission,
    required this.onPress,
  });
  final UserCommission userCommission;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final date = userCommission.createdAt.toIso8601String().split('T').first;
    int multiplier = 0;
    final delivery = userCommission.totalDelivery;
    final type = userCommission.agentType;

    double percentage =
        (100 / userCommission.totalAssignedParcel) *
        userCommission.totalDelivery;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      height: screenHeight * 0.10,
      decoration: BoxDecoration(
        boxShadow: NanoStyles.darkPlasticShadow,
        color: GlobalVariables.secondaryCardSurface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total Delivery',
                              style: NanoTextStyles.listTitleStyle,
                            ),
                            Text(
                              userCommission.totalDelivery.toString(),
                              style: NanoTextStyles.listAmountStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Total Amount',
                              style: NanoTextStyles.listTitleStyle,
                            ),
                            Text(
                              userCommission.totalAmount.toString(),
                              style: NanoTextStyles.listAmountStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Performance',
                              style: NanoTextStyles.listTitleStyle,
                            ),
                            Text(
                              '${percentage.toStringAsFixed(2)}%'.toString(),
                              style: NanoTextStyles.listAmountStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: onPress,
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
