import 'package:flutter/material.dart';
import 'package:flutter_app2/demo5/splash_screen.dart';


void main() {
  runApp(
    MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('启动页'),
      ),
      body: SplashScreen(),
    );
  }
}