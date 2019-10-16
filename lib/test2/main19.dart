import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'SingleChildScrollView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SingleChildScrollViewTestRoute (),
    ),
  );
}

class SingleChildScrollViewTestRoute  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: str.split("").map((c)=>Text(c,textScaleFactor: 2.0,)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}