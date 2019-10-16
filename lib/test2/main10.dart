import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '层叠布局 stack，positioned',
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
        title: Text('层叠布局 stack，positioned'),
      ),
      body: ConstrainedBox(//通过ConstrainedBox来确保Stack占满屏幕
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,  //指定未定位或部分定位widget的对齐方式
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: <Widget>[
            Positioned(
              left: 18.0,
              child: Text('I am Jack'),
            ),
            Container(
              child: Text('hello word ', style: TextStyle(color: Colors.white),),
              color: Colors.red,
            ),
            Positioned(
              top: 18.0,
              child: Text('Your friend'),
            )

          ],
        ),
      ),
    );
  }
}