import 'package:flutter/material.dart';

class CustomBackground extends CustomPainter {
  CustomBackground({this.color = Colors.pinkAccent, this.gradient});

  Color? color;
  LinearGradient? gradient;

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;

    var middleX = centerX * 0.8;
    var middleY = centerY * 0.7;

    var widthEnd = size.width * 0.8;

    const double x = 0;
    const double y = 0;

    Paint paint = Paint();
    paint.color = color!;
    paint.shader = gradient?.createShader(
      Rect.fromCenter(
        center: Offset(middleX / 2, middleY / 2),
        width: middleX,
        height: middleY,
      ),
    );

    Path path = Path()
      ..moveTo(x, y)
      ..lineTo(widthEnd, 0) //Left to Right
      ..quadraticBezierTo(size.width * 1.2, centerY * 0.3, middleX, middleY) //Top to Bottom
      ..quadraticBezierTo((-size.width * 1.2) * 0.3, centerY * 0.3, x, y); // Bottom to Left

    canvas.drawPath(path, paint);

    /*.arcTo(
        Rect.fromPoints(Offset(x, y), Offset(centerX + 80, centerY - 200)),
        -math.pi / 2,
        math.pi,
        false,)*/
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
