import 'package:flutter/material.dart';
import 'demo.dart';
void main() {
  runApp(
    MaterialApp(
      title: '111111111',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
//        appBar: AppBar(
//          title: Text('111111111'),
//        ),
        body: Demo(),
      ),
    ),
  );
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('111111111'),
      ),
      body: Demo(),
    );
  }
}