import 'package:flutter/material.dart';
class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, 0);//第一个坐标
    path.lineTo(0, size.height-80);//第二个坐标
    var firstControlPoint = Offset(size.width/2,size.height);//第一个控制点
    var firstEndPoint = Offset(size.width,size.height -80); //第二个控制结束点
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy); //二次贝塞尔曲线
    path.lineTo(size.width, size.height-80); //第三个点
    path.lineTo(size.width, 0); //第四个点
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return null;
  }

}