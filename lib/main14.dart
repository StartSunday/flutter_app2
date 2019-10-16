import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Row widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('1111111'),
        ),
        body:Center(
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.end,//对齐方式
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('1111111111111'),
              Expanded(child: Text('1111111111')),
              Text('1111111111'),
              Text('111111111'),
            ],
          )
        )

      ),

    );
  }


}