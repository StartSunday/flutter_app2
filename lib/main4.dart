import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("/mimi4.gif",package: "images")
          )
      ),

    );
  }
}
