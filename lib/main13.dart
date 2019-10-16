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
        body: Row(
          children: <Widget>[
            Expanded(child: RaisedButton(
                onPressed: (){},
                color: Colors.blue,
                child: Text('1'),
            ),),
            Expanded(child: RaisedButton(
              onPressed: (){},
              color: Colors.blue,
              child: Text('2'),
            ),),
            Expanded(child: RaisedButton(
              onPressed: (){},
              color: Colors.blue,
              child: Text('3'),
            ),),
          ],
        ),
      ),

    );
  }


}