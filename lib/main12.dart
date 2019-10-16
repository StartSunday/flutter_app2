import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '11111',
      home: Scaffold(
        body: GridView(
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 3, //行数
           mainAxisSpacing: 2, //行间距
           childAspectRatio: 0.7,//高宽比
           crossAxisSpacing: 2,//列间距
         ),
          children: <Widget>[
            Image.asset("images/mimi1.gif",fit:BoxFit.cover ,),
            Image.asset("images/mimi2.gif",fit:BoxFit.cover ,),
            Image.asset("images/mimi3.gif",fit:BoxFit.cover ,),
            Image.asset("images/mimi4.gif",fit:BoxFit.cover ,),
            Image.asset("images/mimi5.gif",fit:BoxFit.cover ,),
            Image.asset("images/mimi6.gif",fit:BoxFit.cover ,),
            Image.asset("images/mimi7.gif",fit:BoxFit.cover ,),
            Image.asset("images/mimi8.gif"),
            Image.asset("images/mimi9.gif"),
            Image.asset("images/mimi10.gif"),
          ],
        ),
      ),
    );
  }
  
}