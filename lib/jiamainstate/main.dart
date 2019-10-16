import 'package:flutter/material.dart';
import 'keep_live.dart';
void main() {
  runApp(MaterialApp(
    title: 'flutterDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: KeepLiveDemo(),
  ));
}

class KeepLiveDemo extends StatefulWidget {
  @override
  _KeepLiveDemoState createState() => _KeepLiveDemoState();
}

class _KeepLiveDemoState extends State<KeepLiveDemo> with SingleTickerProviderStateMixin{
  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3,vsync: this);
  }
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: Text('flutterDemo'),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.insert_drive_file,)),
            Tab(icon: Icon(Icons.insert_drive_file,)),
            Tab(icon: Icon(Icons.insert_drive_file,)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          MyHomePage(),
          MyHomePage(),
          MyHomePage(),
//          Center(
//            child:  Text('1111'),
//          ),
//          Center(
//            child:  Text('2222'),
//          ),
//          Center(
//            child:  Text('3333'),
//          ),
        ],
      ),
    );
  }
}