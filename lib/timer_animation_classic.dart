import 'package:flutter/material.dart';
import 'dart:math' as math;

class TimerPainterClassic extends CustomPainter {
  var text;

  TimerPainterClassic({
    this.text,
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
    double progress = size.width/(animation.value+1);
//    double progress = (1.0 - animation.value) * 2 * math.pi;
//    Rect.fromLTRB(left, top, right, bottom)
    canvas.drawRRect(RRect.fromLTRBAndCorners(progress, 0.0, size.width - progress, size.height), paint);
    //canvas.drawRect(Rect.fromCenter(center: Offset.zero, width: -progress, height: size.height), paint);
    //canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);

    TextSpan span = new TextSpan(style: new TextStyle(color: Colors.grey[600],fontSize:size.width/20 <=40 ? size.width/20:40,fontWeight: FontWeight.bold), text: text, );
    TextPainter tp = new TextPainter(text: span, textAlign: TextAlign.left,textDirection: TextDirection.ltr);
    tp.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    tp.paint(canvas, Offset(size.width/2-(size.width/15),size.height/2-(size.width/35)));
  }

  @override
  bool shouldRepaint(TimerPainterClassic old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}