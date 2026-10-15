import 'dart:math';

import 'package:flutter/material.dart';

//FIXME: Little bit off but will get there, just need some tweak on D,E
class WindShapePainter extends CustomPainter {
  const WindShapePainter([this.pointyAngle = 45, this.color = Colors.blue]);

  final int pointyAngle;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    assert(size.width == size.height);
    assert(pointyAngle >= 0 && pointyAngle <= 360);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height;

    ///      .
    //     /  \
    ///   B    C
    //   /      \
    //  D   F   E
    /// \  /\   /
    ///

    /// `c` for control point

    // -> B
    //D -> B
    final bx = width * .3;
    final by = height * .2;

    /// B->C
    final cx = width * .7;
    final cy = height * .2;
    final ccx = width * .5;
    final ccy = -height * .2;

    //  C -> E
    final ex = width * .9;
    final ey = height * .6;

    // E --> F
    final fx = width * .5;
    final fy = ey + height * .1;
    final fcx = width;
    final fcy = height * .9;

    // F -> D
    final dx = width * .1;
    final dy = ey;
    final dcx = 0.0; //dx + (fx - dx) / 2;
    final dcy = fcy;

    /// The thing I am not getting Why `cubicTo`  didn't work  for me, I could get rid of some bazier curve
    // dart format off
    final path = Path()
      ..moveTo(bx, by)
      ..cubicTo
      ..quadraticBezierTo(ccx, ccy, cx, cy)
      ..lineTo(ex, ey) //righLine
      ..quadraticBezierTo( fcx,fcy, fx, fy) //bottomRight
      ..quadraticBezierTo(dcx,dcy,dx,dy) //bottomLeft
      ..lineTo(bx,by)
      ..close();
    // dart format on

    canvas.save();

    canvas.translate(width / 2, height / 2);
    canvas.rotate(pointyAngle * pi / 180);
    canvas.translate(-width / 2, -height / 2);

    canvas.drawPath(path, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant WindShapePainter oldDelegate) {
    return oldDelegate.pointyAngle != pointyAngle;
  }
}
