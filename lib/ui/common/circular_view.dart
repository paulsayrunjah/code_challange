import 'package:flutter/material.dart';

class CircularView extends StatelessWidget {
  const CircularView({
    super.key,
    required this.size,
    required this.color,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      width: size,
      height: size,
    );
  }
}
