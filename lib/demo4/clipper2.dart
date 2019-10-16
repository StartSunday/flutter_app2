import 'package:flutter/material.dart';
class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, 0);//第一个坐标
    path.lineTo(0, size.height-40);
    var firtControlPoint = Offset(size.width/4,size.height);
    var firstEndPoint = Offset(size.width/2.25,size.height-30);
    path.quadraticBezierTo(firtControlPoint.dx, firtControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondconttrolPoint = Offset(size.width*0.75,size.height - 90);
    var secondEndPoint = Offset(size.width,size.height - 60);

    path.quadraticBezierTo(secondconttrolPoint.dx, secondconttrolPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height -40);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return null;
  }

}