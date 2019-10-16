import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/demo10/widget/counterwidget.dart';

void main() {
  runApp(
    MaterialApp(
      title: '状态测试',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyhomePage(),
    ),
  );
}

class  MyhomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('状态测试'),
      ),
      body: Text('1111'),
    );
  }
}