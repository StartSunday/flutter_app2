import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '111',
      home: Scaffold(
        appBar: AppBar(
          title: Text('1111'),
        ),
        body: Container(
          height: 200,
          child: Mylist(),
        ),
      ),


    );
  }
}

class Mylist extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 180,
            color: Colors.deepOrange,
          ),
          Container(
            width: 180,
            color: Colors.blue,
          ),
          Container(
            width: 180,
            color: Colors.cyan,
          ),
          Container(
            width: 180,
            color: Colors.deepOrange,
          ),
          Container(
            width: 180,
            color: Colors.green,
          ),
        ],

    );
  }

}