import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '111',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('111'),
        ),
        body: Center(
          child: Text.rich(TextSpan(
            children: [
              TextSpan(
                text: 'home'
              ),
              TextSpan(
                text: 'https//www.baidu.com',
                style: TextStyle(
                  color: Colors.blue
                ),
//                recognizer:
              )

            ]
          )),
        ),
      ),
    ),
  );
}

