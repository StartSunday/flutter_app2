import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        ScaffoldState _state = context.ancestorStateOfType(
          TypeMatcher<ScaffoldState>()
        );
        _state.showSnackBar(
          SnackBar(
            content: Text('我是snackBar'),
          )
        );

      },
      child: Text('显示SnackBar'),

    );
  }
}