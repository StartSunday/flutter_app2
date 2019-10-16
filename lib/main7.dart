import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Text widget',
      home: Scaffold(
        body: Center(
          child: Container(
            child: Image.network("http://pic1.win4000.com/wallpaper/c/53cdd1f7c1f21.jpg",
                repeat: ImageRepeat.repeatY,//重复
//                fit: BoxFit.fill,
              color: Colors.greenAccent,
              colorBlendMode: BlendMode.dstATop,
            ),
            width: 300,
            height: 200,
            color: Colors.lightBlue,
          ),
        ),
        
      ),
      
    );
  }
  
}