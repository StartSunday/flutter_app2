import 'package:flutter/material.dart';
//import 'clipper.dart';
import 'clipper2.dart';
void main() {
  runApp(
    MaterialApp(
      title: '贝塞尔曲线',
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
        title: Text('贝塞尔曲线'),
      ),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              color: Colors.pinkAccent,
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}