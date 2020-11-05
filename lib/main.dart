import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipPath(clipper: MyClipper(), child: container()),
    );
  }

  Widget container() {
    return Container(
      color: Colors.blue,
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height / 2.3);
    var bottomLeftStartPoint = Offset(4, size.height / 2.3);
    var bottomLeftEndPoint = Offset(4, size.height / 2.2);
    path.quadraticBezierTo(bottomLeftStartPoint.dx, bottomLeftStartPoint.dy,
        bottomLeftEndPoint.dx, bottomLeftEndPoint.dy);

    path.lineTo(4, size.height / 1.9);
    var bottomRightStartPoint = Offset(4, size.height / 1.8);
    var bottomRightEndPoint = Offset(0.0, size.height / 1.8);
    path.quadraticBezierTo(bottomRightStartPoint.dx, bottomRightStartPoint.dy,
        bottomRightEndPoint.dx, bottomRightEndPoint.dy);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, size.height / 1.8);
    var topRightStartPoint = Offset(size.width - 4, size.height / 1.8);
    var topRightEndPoint = Offset(size.width - 4, size.height / 1.9);
    path.quadraticBezierTo(topRightStartPoint.dx, topRightStartPoint.dy,
        topRightEndPoint.dx, topRightEndPoint.dy);
    path.lineTo(size.width - 4, size.height / 2.2);
    var topLeftStartPoint = Offset(size.width - 4, size.height / 2.3);
    var topLeftEndPoint = Offset(size.width, size.height / 2.3);
    path.quadraticBezierTo(topLeftStartPoint.dx, topLeftStartPoint.dy,
        topLeftEndPoint.dx, topLeftEndPoint.dy);

    path.lineTo(size.width, 0.0);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
