
import 'package:flutter/material.dart';

class TickMarksPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey[400]!
      ..strokeWidth = 2;

    double step = size.width / 5;

    for (int i = 0; i <= 5; i++) {
      canvas.drawLine(
        Offset(i * step, 0),
        Offset(i * step, 5),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
