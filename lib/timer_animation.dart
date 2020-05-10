import 'package:flutter/material.dart';
import 'dart:math' as math;

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromLTRBAndCorners(0.0, 0.0, size.width, size.height), paint);
    //canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = size.width/(animation.value+0.9);
//    double progress = (1.0 - animation.value) * 2 * math.pi;
//    Rect.fromLTRB(left, top, right, bottom)
    canvas.drawRRect(RRect.fromLTRBAndCorners(progress, 0.0, size.width - progress, size.height), paint);
    //canvas.drawRect(Rect.fromCenter(center: Offset.zero, width: -progress, height: size.height), paint);
    //canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}