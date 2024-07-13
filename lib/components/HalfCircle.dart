import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';

class QuarterCircleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: QuarterCircleClipper(),
      child: Container(
        color: Colors.orange,
        width: 300.0,
        height: 100.0,
      ),
    );
  }
}



class EllipseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Ellipse1Widget - VECTOR
    return Transform.rotate(
      angle: -180 * (math.pi / 180),
      child: SizedBox(
        width: 260.5,
        height: 213,
        child: SvgPicture.asset(
          'assets/images/ellipse1.svg',
          semanticsLabel: 'ellipse1',
        ),
      ),
    );
  }
}




class QuarterCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.arcToPoint(
      Offset(0, size.height - 50), // Adjusted endpoint for lower arc
      radius: Radius.circular(size.height / 2), // Adjusted radius for rounder tip
      clockwise: false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
