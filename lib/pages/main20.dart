import 'package:flutter/material.dart';
import 'package:flutter_app2/pages/bottom_avigation_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter bottomNavigationBar' ,
      theme: ThemeData.light(),
      home: BottomNavigationWidget(),
    );
  }

}