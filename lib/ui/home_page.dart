import 'package:flutter/material.dart';
import 'package:vision_code/ui/common/animated_circle_view.dart';
import 'package:vision_code/util/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.appBgColor,
        appBar: AppBar(
          title: const Text('Demo app'),
        ),
        body: Center(
          child: Stack(
            fit: StackFit.loose,
            children: [
              AnimatedCircleView(
                circleOneColor: Colors.green.shade900,
                circleTwoColor: Colors.yellow,
              ),
              const AnimatedCircleView(
                radius: 150,
                circleOneColor: Colors.white,
                circleOneSize: 12,
                circleTwoColor: Colors.red,
                circleTwoSize: 18.0,
                durationDelayForCircleOne: 6000,
                durationDelayForCircleTwo: 4000,
              ),
            ],
          ),
        ),
      );
}
