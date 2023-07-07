import 'dart:ui';

Path drawCircularPath({final double? radius}) {
  Path path = Path();
  path.addOval(
      Rect.fromCircle(center: const Offset(0, 0), radius: radius ?? 100));
  return path;
}

Offset calculateOffsetOfAnimation(
    {required final double animationValue, required final Path path}) {
  PathMetrics pathMetrics = path.computeMetrics();
  PathMetric pathMetric = pathMetrics.elementAt(0);
  final value = pathMetric.length * animationValue;
  Tangent? pos = pathMetric.getTangentForOffset(value);
  return pos?.position ?? const Offset(0, 0);
}
