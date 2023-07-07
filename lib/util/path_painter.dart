import 'package:flutter/material.dart';
import 'package:vision_code/util/app_colors.dart';

class PathPainter extends CustomPainter {
  Path path;
  final Color? pathColor;

  PathPainter(this.path, {this.pathColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = pathColor ?? AppColors.defaultCircleColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
