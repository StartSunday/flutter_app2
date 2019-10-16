import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      alignment: FractionalOffset(0.5,0.8),
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.cyan,
          radius: 100,
          backgroundImage: AssetImage("images/mimi2.gif"),
        ),
//        Positioned(
//          top: 10,
//          left: 10,
//          child: Text('00000'),
//        ),
//        Positioned(
//          bottom: 10,
//          right: 10,
//          child: Text('11111'),
//        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          padding: EdgeInsets.all(10),
          child: Text('111111'),
        )
      ],
    );

    // TODO: implement build
    return MaterialApp(
      title: 'Row widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('1111111'),
        ),
        body:Center(
          child: stack,
        )
      ),

    );
  }


}