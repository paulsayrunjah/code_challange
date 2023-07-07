import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final path = Path();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke;
    path.addOval(Rect.fromCircle(center: const Offset(0, 0), radius: 100));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
