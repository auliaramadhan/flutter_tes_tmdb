import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_private/theme/app_color.dart';

class DashedLinePainter extends CustomPainter {
  final Axis direction;

  DashedLinePainter({this.direction = Axis.horizontal});
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 9, dashSpace = 5, startX = 0, startY = 0;
    final paint = Paint()
      ..color = AppColor.divider
      ..strokeWidth = 1;
    if (Axis.horizontal == direction) {
      while (startX < size.width) {
        canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
        startX += dashWidth + dashSpace;
      }
    } else {
      while (startY < size.height) {
        canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
        startY += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DividerDash extends StatelessWidget {
  const DividerDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomPaint(
        painter: DashedLinePainter(),
      ),
    );
  }
}

class DividerVerticalDash extends StatelessWidget {
  const DividerVerticalDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: CustomPaint(
        painter: DashedLinePainter(direction: Axis.vertical),
      ),
    );
  }
}
