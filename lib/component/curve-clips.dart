import 'package:flutter/cupertino.dart';

class CurveClips extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();
    p.lineTo(0, 4 * size.height / 5);
    p.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, 4 * size.height / 5);
    p.quadraticBezierTo(3 * size.width / 4, 3 * size.height / 5, size.width,
        4 * size.height / 5);
    p.lineTo(size.width, 0);
    p.close();

    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
