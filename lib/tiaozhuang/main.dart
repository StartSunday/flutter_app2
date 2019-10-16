import 'package:flutter/material.dart';
import 'custome_route.dart';

void main() {
  runApp(
    MaterialApp(
      title: '1111',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    ),
  );
}


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('111',style: TextStyle(fontSize: 36),),
        elevation: 4,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64,
          ),
          onPressed: (){
            Navigator.of(context).push(CustomeRoute(SecondPage()));
//            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
//              return SecondPage();
//            }));
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('secondPage',style: TextStyle(fontSize: 36),),
        backgroundColor: Colors.pinkAccent,
        elevation: 1,
        leading: Container(),
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64,
          ),
          onPressed: (){
            Navigator.of(context).pop();

          },
        ),
      ),
    );
  }
}