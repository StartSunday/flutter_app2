import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '11111',
      home: Scaffold(
        body: GridView.count(
          padding: EdgeInsets.all(20),
          crossAxisSpacing: 10,
          crossAxisCount: 5,
          children: <Widget>[
            Text('11111111111111111'),
            Text('11111111111111111'),
            Text('11111111111111111'),
            Text('11111111111111111'),
            Text('11111111111111111'),
            Text('11111111111111111'),
            Text('11111111111111111'),
            Text('11111111111111111'),
            Text('11111111111111111'),
            Text('11111111111111111'),
            Text('11111111111111111'),
            Text('11111111111111111'),
            Text('11111111111111111'),
            Text('11111111111111111'),
            Text('11111111111111111'),
          ],
        ),
      ),
    );
  }
  
}