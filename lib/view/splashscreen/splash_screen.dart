import 'package:flutter/material.dart';
import 'package:nike_project/Utilits/constants/colorConstants.dart';
import 'package:nike_project/Utilits/constants/image_constants.dart';
import 'dart:math';

import 'package:nike_project/view/loginscreen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

  
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

  
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()), 
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colorconstants.primaryblue,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: size.width * 0.2,
              height: size.width * 0.2,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomPaint(
                    painter: _GradientCirclePainter(_controller.value),
                  );
                },
              ),
            ),
            Container(
              height: size.height * 0.05,
              width: size.width * 0.15,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstants.tick),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GradientCirclePainter extends CustomPainter {
  final double progress;

  _GradientCirclePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 4.0;
    final radius = (size.width - strokeWidth) / 2;

    final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: radius);

    final gradient = SweepGradient(
      startAngle: 0,
      endAngle: 2 * pi,
      tileMode: TileMode.clamp,
      stops: const [0.0, 0.25, 1.0],
      colors: const [
        Colorconstants.white,
       Colorconstants.white54,
        Colorconstants.transparent
      ],
      transform: GradientRotation(2 * pi * progress),
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(size.center(Offset.zero), radius, paint);
  }

  @override
  bool shouldRepaint(covariant _GradientCirclePainter oldDelegate) =>
      oldDelegate.progress != progress;
}



