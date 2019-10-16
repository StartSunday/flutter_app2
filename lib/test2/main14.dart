import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '装饰容器 DecoratedBox',
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
        title: Text('装饰容器 DecoratedBox'),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red[400],Colors.orange[600]]
          ),
          borderRadius: BorderRadius.circular(3.0),//3像素圆角
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0,2.0),
              blurRadius: 4.0
            )
          ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 18.0),
          child: Text('Login',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}