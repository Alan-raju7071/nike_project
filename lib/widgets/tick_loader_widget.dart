import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nike_project/Utilits/constants/colorConstants.dart';
import 'package:nike_project/Utilits/constants/image_constants.dart';

class TickLoaderWidget extends StatefulWidget {
  final double size; // Controls the overall size

  const TickLoaderWidget({super.key, required this.size});

  @override
  State<TickLoaderWidget> createState() => _TickLoaderWidgetState();
}

class _TickLoaderWidgetState extends State<TickLoaderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(); // Infinite animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
    return CustomPaint(
      size: Size(widget.size, widget.size), // 🔥 ADD THIS LINE
      painter: _GradientCirclePainter(
        progress: _controller.value,
        strokeWidth: 6.0,
      ),
    );
  },
),

          Container(
            height: widget.size * 0.4,
            width: widget.size * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.tick),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GradientCirclePainter extends CustomPainter {
  final double progress;
  final double strokeWidth;

  _GradientCirclePainter({
    required this.progress,
    this.strokeWidth = 6.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = (size.width - strokeWidth) / 2;
    final center = size.center(Offset.zero);
    final rect = Rect.fromCircle(center: center, radius: radius);

    final gradient = SweepGradient(
      startAngle: 0,
      endAngle: 2 * pi,
      tileMode: TileMode.clamp,
      stops: const [0.0, 0.3, 0.6, 1.0], 
      colors: const [
        Colorconstants.white,
        Colorconstants.white54,
        Colorconstants.transparent,
        Colorconstants.transparent,
      ],
      transform: GradientRotation(2 * pi * progress),
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _GradientCirclePainter oldDelegate) =>
      oldDelegate.progress != progress;
}
