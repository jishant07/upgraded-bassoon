import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    canvas.drawPath(path, paint);
    canvas.drawCircle(Offset(100,100), 50, paint);
    canvas.drawRect(Rect.fromLTRB(50, 100, 200, 10), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CanvasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas Page"),
      ),
      body: CustomPaint(
        painter: ShapePainter(),
        child: Container(),
      )
    );
  }
}

