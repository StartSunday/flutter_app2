import 'package:flutter/material.dart';
class Echo extends StatelessWidget {
  const Echo({Key key ,@required this.text, this.backgroutdColor }): super(key: key);
  final String text;
  final Color backgroutdColor;
  @override
  Widget build(BuildContext context) {
    return Center(
        child:Container(
          color: backgroutdColor,
          child: Text(text),
        ) ,
    );
  }
}