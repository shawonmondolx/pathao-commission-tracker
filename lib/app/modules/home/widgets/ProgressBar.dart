import 'package:flutter/material.dart';
import 'dart:math';

import 'package:pathao_heros/app/Core/Constant_Colors/Colors_Variables.dart';

class PerformanceCircle extends StatelessWidget {
  final double value; // 0-100
  final double size; // width & height

  const PerformanceCircle({super.key, required this.value, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(size: Size(size, size), painter: _CirclePainter(value)),
          Text(
            '${value.toInt()}%',
            style: TextStyle(
              fontSize: size * 0.25,
              fontWeight: FontWeight.bold,
              color: GlobalVariables.chatBubbleMe,
            ),
          ),
        ],
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final double value;

  _CirclePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width * 0.11;

    // Draw background circle
    final backgroundPaint = Paint()
      ..color = GlobalVariables.scaffoldBackground
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      (size.width - strokeWidth) / 2,
      backgroundPaint,
    );

    // Draw foreground arc
    final foregroundPaint = Paint()
      ..color = GlobalVariables.chatBubbleMe
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final double sweepAngle = 2 * pi * (value / 100);

    canvas.drawArc(
      Rect.fromLTWH(
        strokeWidth / 2,
        strokeWidth / 2,
        size.width - strokeWidth,
        size.height - strokeWidth,
      ),
      -pi / 2,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CirclePainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
