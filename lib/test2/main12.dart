import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Padding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding'),
      ),
      body: Padding(
        //上下左右各添加16像素补白
        padding: EdgeInsets.all(16.0),
        child: Column(
          //显式指定对齐方式为左对齐，排除对齐干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              //左边添加8像素补白
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('hello world'),
            ),
            Padding(
              //上下各添加8像素补白
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('I \'am jsck'),
            ),
            Padding(
              //分别指定四个方向的补白
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 6.0, 6.0),
              child: Text('Your friend'),
            )

          ],
        ),
      ),
    );
  }
}