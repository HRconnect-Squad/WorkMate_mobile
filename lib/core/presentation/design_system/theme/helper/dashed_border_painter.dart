import 'dart:ui';

import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double borderRadius;
  DashedBorderPainter({required this.color, required this.borderRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 2;

    final path = Path()
      ..addRRect(
        RRect.fromLTRBR(
          0,
          0,
          size.width,
          size.height,
          Radius.circular(borderRadius),
        ),
      );

    final dashPath = Path();
    const dashWidth = 8.0;
    const dashSpace = 4.0;

    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double nextDistance = distance + dashWidth;
        final double drawLength = nextDistance < metric.length
            ? dashWidth
            : metric.length - distance;

        dashPath.addPath(
          metric.extractPath(distance, distance + drawLength),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
