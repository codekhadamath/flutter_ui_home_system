import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ui_tutorial_1/constants/constant.dart';
import 'package:ui_tutorial_1/constants/style.dart';

class ExpenseMeter extends StatefulWidget {
  final double height;
  final double width;
  final double value;
  const ExpenseMeter(
      {Key? key, this.height = 300.0, this.width = 300.0, this.value = 3.14})
      : super(key: key);

  @override
  _ExpenseMeterState createState() => _ExpenseMeterState();
}

class _ExpenseMeterState extends State<ExpenseMeter>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    final curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    _animation =
        Tween<double>(begin: 0.0, end: widget.value).animate(curvedAnimation)
          ..addListener(() {
            setState(() {});
          });

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CustomPaint(
              size: const Size(300.0, 170.0),
              painter: ProgressMeter(progressColor: AppColor.lightGrey),
            ),
            CustomPaint(
              size: const Size(300.0, 170.0),
              painter: ProgressMeter(
                  arc: _animation.value, progressColor: AppColor.primary),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              top: 60.0,
              child: Column(
                children: [
                  Text(
                    'Expenses',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Space.verticle(),
                  const Text(
                    '\$150.15',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Space.verticle(),
                  const Text(
                    'Good',
                    style: TextStyle(color: AppColor.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 25,
              child: Text(
                '\$0',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[400]),
              ),
            ),
            Expanded(
              flex: 50,
              child: Text(
                '31 January 2022',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[400]),
              ),
            ),
            Expanded(
              flex: 25,
              child: Text(
                '\$430.50',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[400]),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ProgressMeter extends CustomPainter {
  final bool isBackground;
  final double? arc;
  final Color progressColor;

  ProgressMeter(
      {this.isBackground = false, this.arc, required this.progressColor});

  @override
  void paint(Canvas canvas, Size size) {
    const rect = Rect.fromLTRB(0, 0, 300, 300);
    const startAngle = -math.pi;
    final sweepAngle = arc ?? math.pi;
    const useCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
