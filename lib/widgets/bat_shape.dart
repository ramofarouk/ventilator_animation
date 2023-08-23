import 'package:flutter/material.dart';

class BatShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height * 0.2) // Point supérieur gauche
      ..quadraticBezierTo(size.width / 2, 10, size.width,
          size.height * 0.2) // Courbe supérieure
      ..lineTo(size.width * 0.8, size.height * 0.8) // Point inférieur droit
      ..quadraticBezierTo(size.width / 2, size.height, 5,
          size.height * 0.8) // Courbe inférieure
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
