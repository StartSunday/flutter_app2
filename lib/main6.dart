import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Text widget',
      home: Scaffold(
        body: Center(
          child: Container(
            child: Text("1111111", style: TextStyle(fontSize: 40.0,),),
            alignment: Alignment.topLeft,
            width: 500.0,
            height: 400.0,
            color: Colors.lightBlue,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlue,Colors.greenAccent,Colors.deepOrange]
              ),
            ),
//            decoration: BoxDecoration(
////              gradient: LinearGradient(
////                colors: [Colors.lightBlue,Colors.greenAccent,Colors.deepOrange]
////              ),
////                border: Border.all(width: 2.0,color: Colors.black12)
//            ),
          ),
        ),
      ),

    );
  }

}