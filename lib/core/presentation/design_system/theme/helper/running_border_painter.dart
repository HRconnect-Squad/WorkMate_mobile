import 'dart:math' as math;
import 'package:flutter/material.dart';

class RunningBorderPainter extends CustomPainter {
  final Color color;
  final double progress;
  final double strokeWidth;

  RunningBorderPainter({
    required this.color,
    required this.progress,
    this.strokeWidth = 2.5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double radius = 12.0;
    final path = Path();

    path.addArc(
      Rect.fromLTWH(size.width - (radius * 2), 0, radius * 2, radius * 2),
      -math.pi / 2,
      math.pi / 2,
    );

    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: const Radius.circular(radius),
      clockwise: true,
    );

    path.lineTo(radius, size.height);
    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: const Radius.circular(radius),
      clockwise: true,
    );

    path.lineTo(0, radius);
    path.arcToPoint(
      const Offset(radius, 0),
      radius: const Radius.circular(radius),
      clockwise: true,
    );

    path.lineTo(size.width - radius, 0);

    final backgroundPaint = Paint()
      ..color = color.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawPath(path, backgroundPaint);

    final metrics = path.computeMetrics().first;
    final double totalLength = metrics.length;
    final extractPath = metrics.extractPath(0, totalLength * progress);

    final loadingPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(extractPath, loadingPaint);

    if (progress > 0 && progress < 1) {
      final tangent = metrics.getTangentForOffset(totalLength * progress);
      if (tangent != null) {
        final dotPaint = Paint()
          ..color = color
          ..style = PaintingStyle.fill;
        canvas.save();
        canvas.translate(tangent.position.dx, tangent.position.dy);
        canvas.rotate(0.785);
        canvas.drawRect(
          Rect.fromCenter(center: Offset.zero, width: 6, height: 6),
          dotPaint,
        );
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant RunningBorderPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
