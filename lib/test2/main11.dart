import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '对齐与相对定位',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('对齐与相对定位'),
      ),
//      body: Container(
//        height: 120.0,
//        width: 120.0,
//        color: Colors.blue[50],
//        child: Align(
//          alignment: Alignment.bottomRight,
//          child: FlutterLogo(
//            size: 60,
//          ),
//        ),
//      ),
      body: Align(
        widthFactor: 2,
        heightFactor: 2,
        //(Alignment.x*childWidth/2+childWidth/2, Alignment.x*childHeight+childHeight/2)
        alignment: Alignment(2,0.0),
//        alignment: Alignment.bottomLeft,
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }
}