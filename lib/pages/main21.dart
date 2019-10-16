import 'package:flutter/material.dart';
import 'bottom_appbar_demo.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title:  '11111',
      theme: ThemeData(
        primarySwatch:  Colors.lightBlue
      ),
      home: BottomAppBarDemo(),
    );
  }

}