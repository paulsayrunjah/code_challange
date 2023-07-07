import 'package:flutter/material.dart';
import 'package:vision_code/ui/common/circular_view.dart';
import 'package:vision_code/util/app_utils.dart';
import 'package:vision_code/util/path_painter.dart';

class AnimatedCircleView extends StatefulWidget {
  const AnimatedCircleView(
      {this.top,
      this.left,
      this.radius,
      this.durationDelayForCircleOne,
      this.durationDelayForCircleTwo,
      this.circleOneColor,
      this.circleTwoColor,
      this.circleOneSize,
      this.circleTwoSize,
      this.pathColor,
      super.key});

  final double? top;
  final double? left;
  final double? radius;

  final int? durationDelayForCircleOne;
  final int? durationDelayForCircleTwo;

  final double? circleOneSize;
  final double? circleTwoSize;

  final Color? circleOneColor;
  final Color? circleTwoColor;

  final Color? pathColor;

  @override
  State<AnimatedCircleView> createState() => _AnimatedCircleViewState();
}

class _AnimatedCircleViewState extends State<AnimatedCircleView>
    with TickerProviderStateMixin {
  late Path path;
  late Animation _animation;
  late Animation _animation2;
  late Path _path;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    _animation = setupAnimation(widget.durationDelayForCircleOne ?? 5000);
    _animation2 = setupAnimation(widget.durationDelayForCircleTwo ?? 5500);
    _path = drawCircularPath(radius: widget.radius ?? 100);
  }

  Animation setupAnimation(int duration) {
    final controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: duration),
    );
    final animation = Tween(begin: 0.0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat();
    return animation;
  }

  @override
  Widget build(BuildContext context) {
    final top = widget.top ?? 200.0;
    final left = widget.left ?? 195.0;
    final circleOneSize = widget.circleOneSize ?? 10.0;
    final circleTwoSize = widget.circleTwoSize ?? 10.0;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned.fill(
          top: top,
          left: left,
          child: CustomPaint(
            painter: PathPainter(_path, pathColor: widget.pathColor),
          ),
        ),
        Positioned(
          top: getPosition(_animation, _path, top, circleOneSize, Position.top),
          left: getPosition(
              _animation, _path, left, circleOneSize, Position.left),
          child: CircularView(
              size: circleOneSize,
              color: widget.circleOneColor ?? Colors.greenAccent),
        ),
        Positioned(
          top:
              getPosition(_animation2, _path, top, circleTwoSize, Position.top),
          left: getPosition(
              _animation2, _path, left, circleTwoSize, Position.left),
          child: CircularView(
              size: circleTwoSize, color: widget.circleTwoColor ?? Colors.red),
        ),
      ],
    );
  }

  double getPosition(Animation animation, Path path, double position,
      double circleSize, Position positionType) {
    final offSet =
        calculateOffsetOfAnimation(animationValue: animation.value, path: path);
    final offSetValue = positionType == Position.top ? offSet.dy : offSet.dx;
    return offSetValue + (position - circleSize / 2);
  }
}

enum Position { top, left }
