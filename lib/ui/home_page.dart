import 'package:flutter/material.dart';
import 'package:vision_code/ui/common/animated_circle_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Demo app'),
        ),
        body: const Center(
          child: Stack(
            children: [
              AnimatedCircleView(
                circleOneSize: 10,
              ),
              AnimatedCircleView(
                radius: 150,
                circleOneColor: Colors.blue,
                circleOneSize: 14,
                circleTwoColor: Colors.red,
                circleTwoSize: 50.0,
                durationDelayForCircleOne: 6000,
                durationDelayForCircleTwo: 4000,
              ),
            ],
          ),
        ),
      );
}
